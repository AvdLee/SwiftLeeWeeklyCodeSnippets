//
//  NameUpdater.swift
//  SwiftLeeWeeklyCodeSnippets
//
//  Created by A.J. van der Lee on 13/01/2025.
//

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



