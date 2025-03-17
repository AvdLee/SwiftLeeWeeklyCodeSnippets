import Foundation

/*:
 ### SwiftLee Weekly - Issue 260 Code Snippet
 # Expressible Literals in Swift - URLs
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more this feature: [avanderlee.com/swift/expressible-literals/](https://www.avanderlee.com/swift/expressible-literals/)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 There are multiple protocols related to literal expressions:
 */
var integer = 0 // ExpressibleByIntegerLiteral
var string = "Hello!" // ExpressibleByStringLiteral
var array = [0, 1, 2] // ExpressibleByArrayLiteral
var dictionary = ["Key": "Value"] // ExpressibleByDictionaryLiteral
var boolean = true // ExpressibleByBooleanLiteral
/*:
 You can use these to write custom expressions:
 */
extension URL: @retroactive ExpressibleByExtendedGraphemeClusterLiteral {}
extension URL: @retroactive ExpressibleByUnicodeScalarLiteral {}
extension URL: @retroactive ExpressibleByStringLiteral {
    public init(stringLiteral value: StaticString) {
        self.init(string: "\(value)")!
    }
}
/*:
 This example allows you to instantiate URLs like:
 */
let url: URL = "https://www.avanderlee.com"
print(url.host()!) /// Prints: `www.avanderlee.com`



