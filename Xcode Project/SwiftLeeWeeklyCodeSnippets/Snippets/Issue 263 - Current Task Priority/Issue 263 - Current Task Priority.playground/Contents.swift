import Foundation

/*:
 ### SwiftLee Weekly - Issue 263 Code Snippet
 # Current Task Priority
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Become a concurrency expert at [swiftconcurrencycourse.com](https://www.swiftconcurrencycourse.com)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 You might expect a default priority for tasks in Swift Concurrency, but they can be influenced by parent tasks.
 For example, tasks triggered by SwiftUI are often marked as `.high` priority.
 
 To be sure about the current priority for your task, you can use:
 */
Task {
    print("Current task priority: \(Task.currentPriority)")
}
/*:
 This can be useful in cases you want to know more about the inherited task priority and whether you need to revisit the priorities you've set.
 The benefit of structured concurrency is that child tasks inherit contexts. This includes priorities:
 */

Task(priority: .low) {
    await someAsyncMethod()
}

func someAsyncMethod() async {
    print("Current task priority: \(Task.currentPriority)")
}
/*:
 In the above example, `someAsyncMethod()` inherits the `.low` priority from the enclosing `Task { ... }`.

 > Note
 > Task scheduling is influenced by the executor, which decides how priority information impacts execution order. While most executors try to run higher-priority tasks before lower-priority ones, the exact behavior depends on the platform and the specific Executor implementation.
 >
 > There are cases where a task’s priority is temporarily elevated without actually changing its assigned priority to ensure that the queued task doesn’t experience unnecessary delays.
 >
 > For more details, I encourage you to check out [swiftconcurrencycourse.com](https://www.swiftconcurrencycourse.com)
 */


