import Foundation
import UIKit
/*:
 ### SwiftLee Weekly - Issue 270 Code Snippet
 # Lazy Variables in Swift
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more this feature: [avanderlee.com/swift/lazy-var-property/](https://www.avanderlee.com/swift/lazy-var-property/)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 Lazy variables in Swift allow you to defer property initialization until it's first accessed.
 This is useful for expensive computations or when you need to reference self during initialization.
 #### Basic lazy property example:
 */
class ImageLoader {
    let imageName: String
    
    lazy var image: UIImage = {
        print("Loading image...")
        return UIImage(named: imageName) ?? UIImage()
    }()
    
    init(imageName: String) {
        self.imageName = imageName
        print("ImageLoader initialized")
    }
}

let loader = ImageLoader(imageName: "profile")
print("ImageLoader created")
/// Image is loaded only when accessed.
let image = loader.image

/*:
 Key points about lazy properties:
 - Must be variables (var), not constants (let)
 - Cannot have property observers
 - Are not thread-safe by default
 - Useful for expensive computations or when you need to reference self
 ## Lazy Properties with Computed Values
 */
final class DataManager {
    let data: [Int]
    
    /// Lazy property that computes a value only once.
    lazy var sortedData: [Int] = {
        print("Sorting data...")
        return data.sorted()
    }()
    
    init(data: [Int]) {
        self.data = data
    }
}

let manager = DataManager(data: [5, 2, 8, 1, 9])
/// First access - sorts the data
print(manager.sortedData)
/// Second access - uses cached result
print(manager.sortedData)
/*:
 ## When to Use Lazy Properties
 
 - When the property's initial value depends on other properties that might not be set during initialization
 - When the property's initialization is computationally expensive
 - When the property might not be needed during the object's lifetime
 - When you need to reference self during property initialization
 
 ## Performance Considerations
 
 While lazy properties can improve performance by deferring initialization, they do add a small overhead:
 - Each access requires a check to see if the property has been initialized
 - The property must be stored as a variable, which means it can be modified
 - The property is not thread-safe by default
 
 Use lazy properties judiciously and only when the benefits outweigh these costs.
 */
