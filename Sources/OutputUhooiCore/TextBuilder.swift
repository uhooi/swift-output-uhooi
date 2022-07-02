public enum TextBuilder {
    public static func buildText(phrase: String, count: Int?, includeCounter: Bool) -> String {
        let repeatCount = count ?? 1
        guard repeatCount >= 1 else {
            return "'count' option must be greater than or equal to 1."
        }
        
        let row = "┌|▼▼|┘<\(phrase)"
        return (1...repeatCount)
            .map { (includeCounter ? "\($0): " : "") + row }
            .joined(separator: "\n")
    }
}
