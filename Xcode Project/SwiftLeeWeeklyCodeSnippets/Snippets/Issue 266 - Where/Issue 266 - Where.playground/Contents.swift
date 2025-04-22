import Foundation

/*:
 ### SwiftLee Weekly - Issue 266 Code Snippet
 # Using the `where` keyword
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more this feature: [avanderlee.com/swift/where-using-swift/](https://www.avanderlee.com/swift/where-using-swift/)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 Consider having the following enum:
 */
enum Action {
    case createUser(age: Int)
    case createPost
    case logout
}
/*:
 Using where you can easily filter the case for a specific age range:
 */
func printAction(action: Action) {
    switch action {
    case .createUser(let age) where age < 21:
        print("Young and wild!")
    case .createUser:
        print("Older and wise!")
    case .createPost:
        print("Creating a post")
    case .logout:
        print("Logout")
    }
}

printAction(action: Action.createUser(age: 18)) // Young and wild
printAction(action: Action.createUser(age: 25)) // Older and wise
/*:
 You can also use `where` inside for loops:
 */
let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for number in numbers where number % 2 == 0 {
    print(number) // 0, 2, 4, 6, 8, 10
}
/*: Or in functions and initializers: */
extension String {
    init<T>(collection: [T]) where T: StringProtocol {
        self = collection.joined(separator: ",")
    }
}

let clubs = String(collection: ["AJAX", "Barcelona", "PSG"])
print(clubs) // prints "AJAX, Barcelona, PSG"



