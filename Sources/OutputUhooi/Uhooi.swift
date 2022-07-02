import ArgumentParser
import OutputUhooiCore

@main
struct Uhooi: AsyncParsableCommand {
    
    static var configuration = CommandConfiguration(
        abstract: "Uhooi speak the phrase.",
        version: "0.2.0"
    )
    
    @Flag(help: "Include a counter with each repetition.")
    var includeCounter = false
    
    @Option(name: .shortAndLong, help: "The number of times to repeat 'phrase'.")
    var count: Int?
    
    @Argument(help: "The phrase to repeat.")
    var phrase: String
    
    mutating func run() async throws {
        print(TextBuilder.buildText(phrase: phrase, count: count, includeCounter: includeCounter))
    }
}
