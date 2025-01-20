/*:
 ### SwiftLee Weekly - Issue 255 Code Snippet
 # Nonmutating in Swift
 
 - Try this snippet at [github.com/AvdLee/SwiftLeeWeeklyCodeSnippets](https://github.com/AvdLee/SwiftLeeWeeklyCodeSnippets)
 - Read more about Structs: [avanderlee.com/swift/struct-class-differences/](https://www.avanderlee.com/swift/struct-class-differences/)
 - Receive a weekly Swift code snippet: [join.swiftlee-weekly.com](https://join.swiftlee-weekly.com)
 */
import Foundation

struct Movie {
    let id: Int
    let title: String
    
    /// This property's setter is not mutating `Movie` itself.
    /// Therefore, we can configure the setter as `nonmutating`.
    var isFavorite: Bool {
        get {
            FavoritesStore.isFavorite(movieID: id)
        }
        nonmutating set {
            if newValue {
                FavoritesStore.add(id)
            } else {
                FavoritesStore.remove(id)
            }
        }
    }
}

let movie = Movie(id: 1, title: "The Shawshank Redemption")
print(movie.isFavorite) // Prints: false

/// Using `nonmutating` allows us to change the `isFavorite` value even when movie is defined as a `let`.
movie.isFavorite = true


/// This would be the error we would get if we didn't use `nonmutating`:
/// 'Cannot assign to property: 'movie' is a 'let' constant'
movie.isFavorite = true





/// A non-serious example favorites store for the sake of the above example.
struct FavoritesStore {
    static func isFavorite(movieID: Int) -> Bool {
        guard let favoriteMovieIDs = UserDefaults.standard.array(forKey: "favorite_movies") as? [Int] else {
            return false
        }
        return favoriteMovieIDs.contains(movieID)
    }
    
    static func add(_ movieID: Int) {
        var favoriteMovieIDs = UserDefaults.standard.array(forKey: "favorite_movies") as? [Int] ?? []
        favoriteMovieIDs.append(movieID)
        UserDefaults.standard.set(favoriteMovieIDs, forKey: "favorite_movies")
    }
    
    static func remove(_ movieID: Int) {
        var favoriteMovieIDs = UserDefaults.standard.array(forKey: "favorite_movies") as? [Int] ?? []
        favoriteMovieIDs.removeAll(where: { $0 == movieID })
        UserDefaults.standard.set(favoriteMovieIDs, forKey: "favorite_movies")
    }
}
