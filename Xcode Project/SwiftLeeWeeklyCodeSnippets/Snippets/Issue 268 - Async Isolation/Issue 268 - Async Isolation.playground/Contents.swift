import Foundation

/*:
 ### SwiftLee Weekly - Issue 268 Code Snippet
 # Async Function Isolation Upcoming Changes
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Stay current with Swift Concurrency: [swiftconcurrencycourse.com](https://www.swiftconcurrencycourse.com)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 The Swift Teams is on a mission: making Swift Concurrency more approachable. An upcoming change related to this mission is changing the behavior of nonisolated async functions.
 
 ### Old scenario:
 */
class NotSendable {
    func performAsync() async {
        print("Task started on thread: \(Thread.currentThread)")
    }
}

@MainActor
struct OldThreadingDemonstrator {
    
    func demonstrate() async {
        print("Starting on the main thread: \(Thread.currentThread)")
        // Prints: Starting on the main thread: <_NSMainThread: 0x6000006b4040>{number = 1, name = main}

        let notSendable = NotSendable()
        await notSendable.performAsync()
        // Prints: Task started on thread: <NSThread: 0x600003694d00>{number = 8, name = (null)}
        
        /// Returning on the main thread.
        print("Resuming on the main thread: \(Thread.currentThread)")
        // Prints: Resuming on the main thread: <_NSMainThread: 0x6000006b4040>{number = 1, name = main}
    }
}
/*:
 ### New scenario
 Note that we're not leaving the main thread anymore. The nonisolate async function inherits the caller's actor.
 */
@MainActor
struct NewThreadingDemonstrator {
    
    func demonstrate() async {
        print("Starting on the main thread: \(Thread.currentThread)")
        // Prints: Starting on the main thread: <_NSMainThread: 0x6000006b4040>{number = 1, name = main}

        let notSendable = NotSendable()
        await notSendable.performAsync()
        // Prints: Task started on thread: <_NSMainThread: 0x6000006b4040>{number = 1, name = main}
        
        /// Returning on the main thread.
        print("Resuming on the main thread: \(Thread.currentThread)")
        // Prints: Resuming on the main thread: <_NSMainThread: 0x6000006b4040>{number = 1, name = main}
    }
}

/*:
 This ensures that nonisolated functions will have consistent execution semantics by default, whether they’re sync or async.
 More detailed info about this change can be found in [SE-461](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0461-async-function-isolation.md) or by following my course at [swiftconcurrencycourse.com](https://www.swiftconcurrencycourse.com).
 */
extension Thread {
    /// A convenience method to print out the current thread from an async method.
    /// This is a workaround for compiler error:
    /// Class property 'current' is unavailable from asynchronous contexts; Thread.current cannot be used from async contexts.
    /// See: https://github.com/swiftlang/swift-corelibs-foundation/issues/5139
    public static var currentThread: Thread {
        return Thread.current
    }
}


