import Foundation

/*:
 ### SwiftLee Weekly - Issue 264 Code Snippet
 # Region Based Isolation in Swift Concurrency
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Become a concurrency expert at [swiftconcurrencycourse.com](https://www.swiftconcurrencycourse.com)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 Imagine having defined the following `Counter` class:
 */
class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
}
/*:
 The class is not marked as `Sendable` and risks data races.
 > Question:
 > Do you think the following method compiles?
 */
func someMethod() {
    let counter = Counter()
    
    Task {
        counter.increment()
        print("Count is: \(counter.count)")
    }
}
/*:
 Try out the code snippet and find out. Did you know the correct answer?
 For more details, I encourage you to check out [swiftconcurrencycourse.com](https://www.swiftconcurrencycourse.com)
 */
