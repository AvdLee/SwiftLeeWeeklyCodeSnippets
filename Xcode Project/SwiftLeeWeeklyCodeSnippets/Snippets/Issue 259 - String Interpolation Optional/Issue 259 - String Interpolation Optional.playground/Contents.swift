/*:
 ### SwiftLee Weekly - Issue 259 Code Snippet
 # Custom String Interpolation - Optionals
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more this feature: [avanderlee.com/swift/string-interpolation/](https://www.avanderlee.com/swift/string-interpolation/)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 String interpolation allows you to reference objects inside Strings:
 */
var title: String? = "SwiftLee - A blog about Swift"
print("The title is \(title!)")
/*:
 The previous example isn't great, as it uses force unwrapping. Yet, otherwise we would have to do either of:
 */
if let unwrappedTitle = title {
    print("The title is \(unwrappedTitle)")
}
/*:
 Instead, we could use a custom `String.StringInterpolation` definition:
 */
extension String.StringInterpolation {

    /// Prints `Optional` values by only interpolating it if the value is set. `nil` is used as a fallback value to provide a clear output.
    mutating func appendInterpolation<T: CustomStringConvertible>(_ value: T?) {
        appendInterpolation(value ?? "nil" as CustomStringConvertible)
    }
}
/*:
 After which we can print out optionals as follows:
 */
print("The title is \(title)")
// Prints: The title is SwiftLee - A blog about Swift


