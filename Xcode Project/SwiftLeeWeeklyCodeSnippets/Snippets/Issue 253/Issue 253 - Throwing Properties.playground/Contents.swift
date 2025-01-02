/*:
 # SwiftLee Weekly - Issue 253 Code Snippet
 ## Throwing Properties
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more about throwing properties: [avanderlee.com/swift/throwing-properties](https://www.avanderlee.com/swift/throwing-properties/)
 - Receive a weekly Swift code snippet: [swiftlee-weekly.com](https://www.swiftlee-weekly.com)
 */
import Foundation

struct SampleFile {
    let url: URL
    var data: Data {
        
        /// Using a throwing getter allows you to catch failures at the caller side.
        get throws {
            try Data(contentsOf: url)
        }
    }
}

do {
    let file = SampleFile(url: URL(filePath: "/path/to/file"))
    let data = try file.data
    print(data)
} catch {
    print(error)
    
    /// Prints:
    /// Error Domain=NSCocoaErrorDomain Code=260 "The file “file” couldn’t be opened because there is no such file."
}


