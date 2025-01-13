/*:
 ### SwiftLee Weekly - Issue 254 Code Snippet
 # @discardableResult in Swift
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more about @discardableResult: [avanderlee.com/swift/discardableresult/](https://www.avanderlee.com/swift/discardableresult/)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 */
import Foundation

struct User: Decodable {
    let name: String
}

enum APIProvider {
    static func updateName(_ name: String) -> User {
        // .. Handle API endpoint, example result:
        return User(name: name)
    }
    
    /// Using the `@discardableResult` attribute you make it optional to use the return object at implementation level.
    @discardableResult
    static func updateNameDiscardingResult(_ name: String) -> User {
        // .. Handle API endpoint, example result:
        return User(name: name)
    }
}

struct NameUpdater {
    let name: String
    
    func updateName() {
        /// Shows "Result of call to 'updateName' is unused"
        APIProvider.updateName(name)
        
        /// You can solve this using an underscore:
        _ = APIProvider.updateName(name)
        
        /// However, using the discardableResult variant is cleaner!
        APIProvider.updateNameDiscardingResult(name)
    }
}



