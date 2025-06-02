import SwiftUI
import PlaygroundSupport

/*:
 ### SwiftLee Weekly - Issue 272 Code Snippet
 # Constant Binding in SwiftUI
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 SwiftUI's `.constant()` binding is perfect for prototyping views that require a binding but don't need to be interactive.
 
 It creates a constant binding that never changes, making it ideal for previews and testing.
 
 #### Using constant binding in TextField:
 */
struct ContentView: View {
    var body: some View {
        TextField("Enter text (placeholder)", text: .constant("This is an example text for quickly prototyping"))
            .textFieldStyle(.roundedBorder)
            .padding()
    }
}

/*:
 #### Using constant binding in Toggle:
 */
struct ToggleExample: View {
    var body: some View {
        Toggle("Always on", isOn: .constant(true))
            .padding()
    }
}

/*:
 Key points about constant binding:
 - Creates a binding that never changes
 - Perfect for previews and prototyping
 - Useful when you need a binding but don't need interactivity
 - Can be used with any SwiftUI view that requires a binding
 */
