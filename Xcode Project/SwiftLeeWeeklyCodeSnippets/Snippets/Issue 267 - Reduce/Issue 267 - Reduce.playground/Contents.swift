import Foundation

/*:
 ### SwiftLee Weekly - Issue 267 Code Snippet
 # Using the `reduce` function
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more this feature: [avanderlee.com/swift/swift-reduce-combining-elements-into-a-single-value/](https://www.avanderlee.com/swift/swift-reduce-combining-elements-into-a-single-value/)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 Reduce is a typical functional pattern, a higher-order function that combines a collection into a single value cleanly and expressively. Its complexity is `O(n)`, where `n` is the length of the sequence. With that in mind, it’s time to dive into some swift reduce examples!:
 
 ### Sum up a collection of numbers:
 */
let numbers = [1, 2, 3, 4, 5]
let total = numbers.reduce(0) { result, number in
    result + number
}
// total == 15
/*: Or, shorthand: */
let totalShort = numbers.reduce(0, +)
/*: ### Reduce into a Dictionary: */
let names = ["Antoine", "Maaike", "Jaap", "Jip"]
let grouped: [String: [String]] = names.reduce(into: [:]) { result, name in
    let firstLetter = String(name.first!)
    result[firstLetter, default: []].append(name)
}
// grouped == ["M": ["Maaike"], "A": ["Antoine"], "J": ["Jaap", "Jip"]]
/*: ### Count occurrences: */
let animals = ["Dog", "Cat", "Dog", "Bird"]
let counts = animals.reduce(into: [:]) { result, animal in
    result[animal, default: 0] += 1
}
// counts == ["Dog": 2, "Cat": 1, "Bird": 1]
/*: ### Flatten nested arrays: */
let nested = [[1, 2], [3, 4], [5]]
let flat = nested.reduce([], +)
// flat == [1, 2, 3, 4, 5]


