import XCTest
import class Foundation.Bundle

final class OutputUhooiTests: XCTestCase {
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
    
    func test_OutputUhooi() throws {
        guard #available(macOS 10.13, *) else {
            throw XCTSkip("This tests are for macOS 10.13+")
        }

        #if !targetEnvironment(macCatalyst)
        typealias TestCase = (arguments: [String], expected: String, line: UInt)
        let testCases: [TestCase] = [
            (["This is test."], "┌|▼▼|┘<This is test.\n", #line),
            (["--count", "0", "This is test."], "'count' option must be greater than or equal to 1.\n", #line),
            (["--count", "1", "This is test."], "┌|▼▼|┘<This is test.\n", #line),
            (["--count", "2", "This is test."], "┌|▼▼|┘<This is test.\n┌|▼▼|┘<This is test.\n", #line),
            (["-c", "2", "This is test."], "┌|▼▼|┘<This is test.\n┌|▼▼|┘<This is test.\n", #line),
            (["--include-counter", "This is test."], "1: ┌|▼▼|┘<This is test.\n", #line),
            (["--include-counter", "--count", "2", "This is test."], "1: ┌|▼▼|┘<This is test.\n2: ┌|▼▼|┘<This is test.\n", #line),
            (["--version"], "0.1.0\n", #line),
        ]
        
        for (arguments, expected, line) in testCases {
            let binary = productsDirectory.appendingPathComponent("OutputUhooi")

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
        }
        #endif
    }
}
