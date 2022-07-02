import XCTest
import class Foundation.Bundle

final class OutputUhooiTests: XCTestCase {
    
    // MARK: Computed Instance Properties
    
    private var productsDirectory: URL {
        #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
        #else
        return Bundle.main.bundleURL
        #endif
    }
    
    // MARK: - Test Methods
    
    // MARK: Uhooi
    
    func test_Uhooi() throws {
        typealias TestCase = (arguments: [String], expected: String, line: UInt)
        let testCases: [TestCase] = [
            (["This is test."], "┌|▼▼|┘<This is test.\n", #line),
            (["--count", "0", "This is test."], "'count' option must be greater than or equal to 1.\n", #line),
            (["--count", "1", "This is test."], "┌|▼▼|┘<This is test.\n", #line),
            (["--count", "2", "This is test."], "┌|▼▼|┘<This is test.\n┌|▼▼|┘<This is test.\n", #line),
            (["-c", "2", "This is test."], "┌|▼▼|┘<This is test.\n┌|▼▼|┘<This is test.\n", #line),
            (["--include-counter", "This is test."], "1: ┌|▼▼|┘<This is test.\n", #line),
            (["--include-counter", "--count", "2", "This is test."], "1: ┌|▼▼|┘<This is test.\n2: ┌|▼▼|┘<This is test.\n", #line),
        ]
        
        for (arguments, expected, line) in testCases {
            try checkOutput(arguments: arguments, expected: expected, line: line)
        }
    }
    
    func test_Uhooi_help() throws {
        let expected = """
            OVERVIEW: Uhooi speak the phrase.
            
            USAGE: uhooi [--include-counter] [--count <count>] <phrase>
            
            ARGUMENTS:
              <phrase>                The phrase to repeat.
            
            OPTIONS:
              --include-counter       Include a counter with each repetition.
              -c, --count <count>     The number of times to repeat 'phrase'.
              --version               Show the version.
              -h, --help              Show help information.
            
            
            """
        try checkOutput(arguments: ["--help"], expected: expected, line: #line)
    }
    
    func test_Uhooi_version() throws {
        try checkOutput(arguments: ["--version"], expected: "0.2.0\n", line: #line)
    }
    
    // MARK: - Other Private Methods
    
    private func checkOutput(arguments: [String], expected: String, line: UInt) throws {
        #if !targetEnvironment(macCatalyst)
        let binary = productsDirectory.appendingPathComponent("uhooi")
        
        let process = Process()
        process.executableURL = binary
        process.arguments = arguments
        
        let pipe = Pipe()
        process.standardOutput = pipe
        
        try process.run()
        process.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)
        
        XCTAssertEqual(output, expected, line: line)
        #endif
    }
}
