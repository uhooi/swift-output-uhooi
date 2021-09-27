import ArgumentParser

struct Uhooi: ParsableCommand {
    private static let uhooiEmotion = "┌|▼▼|┘"
    
    static var configuration = CommandConfiguration(
        abstract: "Uhooi speak the phrase.",
        version: "0.1.1"
    )
    
    @Flag(help: "Include a counter with each repetition.")
    var includeCounter = false

    @Option(name: .shortAndLong, help: "The number of times to repeat 'phrase'.")
    var count: Int?

    @Argument(help: "The phrase to repeat.")
    var phrase: String

    mutating func run() throws {
        let repeatCount = count ?? 1
        guard repeatCount >= 1 else {
            print("'count' option must be greater than or equal to 1.")
            return
        }
        
        let string = "\(Self.uhooiEmotion)<\(phrase)"

        for i in 1...repeatCount {
            if includeCounter {
                print("\(i): \(string)")
            } else {
                print(string)
            }
        }
    }
}

Uhooi.main()
