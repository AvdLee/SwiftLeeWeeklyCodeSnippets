import Foundation

/*:
 ### SwiftLee Weekly - Issue 269 Code Snippet
 # Looping in Swift using labels
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 
 Labeled statements in Swift give you more control over your loops and conditionals. You can use them to break or continue not just the nearest loop, but an outer one as well. Let’s explore how this works:
 
 #### Break out of a nested loop:
 */
outerLoop: for i in 1...3 {
    for j in 1...3 {
        if i == 2 && j == 2 {
            break outerLoop
        }
        print("i: \(i), j: \(j)")
    }
}
/*:
 This prints:
 
     i: 1, j: 1
     i: 1, j: 2
     i: 1, j: 3
     i: 2, j: 1

 
 #### Continue outer loop from nested loop:
 */
mainLoop: for x in 1...3 {
    for y in 1...3 {
        if y == 2 {
            continue mainLoop
        }
        print("x: \(x), y: \(y)")
    }
}
/*:
 This prints:
 
     x: 1, y: 1
     x: 2, y: 1
     x: 3, y: 1
 
 Labeled loops can be useful when dealing with complex control flows and multiple loops in one place.
*/



