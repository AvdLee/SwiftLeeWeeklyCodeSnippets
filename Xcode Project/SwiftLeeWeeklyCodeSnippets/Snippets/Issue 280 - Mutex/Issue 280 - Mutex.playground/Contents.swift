import Foundation

/*:
 ### SwiftLee Weekly - Issue 280 Code Snippet
 # Mutex for Safe Access to Non-Sendable Types
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 - Dive deeper into Swift Concurrency with the essential course: [swiftconcurrencycourse.com](https://www.swiftconcurrencycourse.com)
 
 Swift's concurrency model enforces Sendable types for safe data access across threads. However, you may need to work with non-Sendable types, such as mutable arrays.
 
 A Mutex (mutual exclusion lock) can help you safely access such types from multiple threads.
 */
import Synchronization

/// Conforms to `Sendable` since we synchronized access to the mutable `searchHistory` array.
final class SearchHistory: Sendable {
    private let searchHistory = Mutex<[String]>([])
    
    var currentHistory: [String] {
        /// We use the `withLock` method to return the current history in a thread-safe way.
        searchHistory.withLock { $0 }
    }
    
    func storeSearchQuery(_ query: String) {
        searchHistory.withLock { history in
            /// The closure `history` parameter is an `inout` parameter, allowing for mutations.
            history.append(query)
        }
    }
}

let searchHistory = SearchHistory()
searchHistory.storeSearchQuery("Swift Concurrency")
print(searchHistory.currentHistory) // Prints: ["Swift Concurrency"]


