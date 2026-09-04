//
//  UserStorageService.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import Foundation

final class UserStorageService : UserStorageProtocol{

    private let usernameKey = "saved_username"

    func saveUser(_ user: User) {

        UserDefaults.standard.set(
            user.username,
            forKey: usernameKey
        )

        KeychainService.shared.savePassword(
            username: user.username,
            password: user.password
        )
    }

    func getUser() -> User? {

        guard let username =
            UserDefaults.standard.string(
                forKey: usernameKey
            )
        else {
            return nil
        }

        guard let password =
            KeychainService.shared.getPassword(
                username: username
            )
        else {
            return nil
        }

        return User(
            username: username,
            password: password
        )
    }
}
