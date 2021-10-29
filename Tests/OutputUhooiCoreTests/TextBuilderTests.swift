import XCTest
@testable import OutputUhooiCore

final class TextBuilderTests: XCTestCase {
    
    // MARK: - Test Methods
    
    // MARK: buildText()
    
    func test_buildText() {
        typealias TestCase = (phrase: String, count: Int?, includeCounter: Bool, expected: String, line: UInt)
        let testCases: [TestCase] = [
            ("This is test.", nil, false, "┌|▼▼|┘<This is test.", #line),
            ("This is test.", 0, false, "'count' option must be greater than or equal to 1.", #line),
            ("This is test.", 1, false, "┌|▼▼|┘<This is test.", #line),
            ("This is test.", 2, false, "┌|▼▼|┘<This is test.\n┌|▼▼|┘<This is test.", #line),
            ("This is test.", 1, true, "1: ┌|▼▼|┘<This is test.", #line),
            ("This is test.", 2, true, "1: ┌|▼▼|┘<This is test.\n2: ┌|▼▼|┘<This is test.", #line),
        ]
        
        for (phrase, count, includeCounter, expected, line) in testCases {
            let actual = TextBuilder.buildText(phrase: phrase, count: count, includeCounter: includeCounter)
            XCTAssertEqual(actual, expected, line: line)
        }
    }
    
}
