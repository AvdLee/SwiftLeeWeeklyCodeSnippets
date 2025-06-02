import Foundation

/*:
 ### SwiftLee Weekly - Issue 273 Code Snippet
 # Fallthrough in Swift Enums
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 The `fallthrough` keyword in Swift allows you to continue execution to the next case in a switch statement, even when the current case matches.
 
 #### Using fallthrough in enum cases:
 */
enum UserRole {
    case admin
    case moderator
    case user
}

func checkPermissions(for role: UserRole) {
    switch role {
    case .admin:
        print("Admin access granted")
        fallthrough
    case .moderator:
        print("Moderator access granted")
        fallthrough
    case .user:
        print("User access granted")
    }
}

/// Admin gets all permissions
checkPermissions(for: .admin)
/// Moderator gets moderator and user permissions
checkPermissions(for: .moderator)
/// User only gets user permissions
checkPermissions(for: .user)

/*:
 Key points about fallthrough:
 - Continues execution to the next case
 - Useful for sharing code between cases
 - Can be used to implement hierarchical permissions
 - Only works in switch statements
 */



