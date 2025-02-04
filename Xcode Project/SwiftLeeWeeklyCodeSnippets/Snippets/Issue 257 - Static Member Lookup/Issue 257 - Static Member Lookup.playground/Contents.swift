/*:
 ### SwiftLee Weekly - Issue 257 Code Snippet
 # Static Member Lookup in Swift
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more this feature: [avanderlee.com/swift/static-member-lookup-generic-contexts/](https://www.avanderlee.com/swift/static-member-lookup-generic-contexts/)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 */
import Foundation
import SwiftUI
/*:
 Without Static Member Lookup, you would use a custom button style as follows:
 */
struct ContentView: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button("Open SwiftLee") {
            openURL(URL(string: "https://www.avanderlee.com")!)
        }
        .buttonStyle(SwiftLeeButtonStyle()) // The button style is initialised here.
    }
}
/*:
 By using Static Member Lookup in Generic Contexts, you can create a static accessor:
 */
extension ButtonStyle where Self == SwiftLeeButtonStyle {
    static var swiftLee: SwiftLeeButtonStyle { .init() }
}
/*:
 Doing so allows you to reference the custom button style using `.swiftLee` instead.
 
 An extra benefit: your button styles are discoverable using autocompletion.
 */
struct ButtonContainerView: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button("Open SwiftLee") {
            openURL(URL(string: "https://www.avanderlee.com")!)
        }
        /// Now referenced using the static member.
        .buttonStyle(.swiftLee)
    }
}





struct SwiftLeeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("swiftlee_orange"))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
