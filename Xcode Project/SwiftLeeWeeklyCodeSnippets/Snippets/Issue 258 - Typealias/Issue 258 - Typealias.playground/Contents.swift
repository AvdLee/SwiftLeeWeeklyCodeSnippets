/*:
 ### SwiftLee Weekly - Issue 258 Code Snippet
 # Typealias in Swift
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more this feature: [avanderlee.com/swift/typealias-usage-swift/](https://www.avanderlee.com/swift/typealias-usage-swift/)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 A typealias in Swift creates a self-explanatory, more readable name for an existing type.
 */
typealias Dollar = Double
/*:
 The impact of understanding code by using a typealias is visible in the following example.
 */
struct Product {
    
    /// Due to the typealias, we understand that the default price is in dollars.
    let price: Dollar
}
/*:
 You can even create extensions for a typealias. Though, these apply to the underlying type too.
 */
extension Dollar {
    func printValue() { print("Price is $\(String(format: "%.2f", self))") }
}
let price: Dollar = 100
let number: Double = 20

price.printValue() // Prints: Price is $100.00
number.printValue() // Prints: Price is $20.00




