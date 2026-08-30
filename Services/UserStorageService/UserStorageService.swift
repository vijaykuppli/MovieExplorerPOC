//
//  UserStorageService.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import Foundation

class UserStorageService {

    private let userKey = "saved_user"

    func saveUser(_ user: User) {

        if let data = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(data, forKey: userKey)
        }
    }

    func getUser() -> User? {

        guard let data = UserDefaults.standard.data(forKey: userKey)
        else { return nil }

        return try? JSONDecoder().decode(User.self, from: data)
    }
}
