/*:
 ### SwiftLee Weekly - Issue 256 Code Snippet
 # Defer in Swift
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more about Structs: [avanderlee.com/swift/defer-usage-swift/](https://www.avanderlee.com/swift/defer-usage-swift/)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 */
import Foundation
import SwiftUI
/*:
 Defer executes on scope exit. This is how the order works:
 */
func printStringNumbers() {
    defer { print("1") }
    defer { print("2") }
    defer { print("3") }

    print("4")
}
/*: The above prints: 4, 3, 2, 1.
 The last defined defer executes first.
### Practical Use Case 1: Closing a file handle at the end of the scope */
func writeFile(filePath: String) throws {
    // Open the file handle.
    let file: FileHandle? = FileHandle(forReadingAtPath: filePath)
    
    defer {
        // Ensure the file handle closes on scope exit.
        file?.closeFile()
    }

    // Write changes to the file.
    try file?.write(contentsOf: Data("Hello, World!".utf8))
}
/*: ### Practical Use Case 2: Loading State */
func loadImageDataForURL(_ imageURL: URL, isLoading: Binding<Bool>) async throws -> Data {
    /// Set the loading state to `true` so the user interface could show a spinner.
    isLoading.wrappedValue = true
    
    defer {
        /// Use `defer` to turn the loading state back off when downloading finishes.
        isLoading.wrappedValue = false
    }
    
    let (data, _) = try await URLSession.shared.data(from: imageURL)
    return data
}


