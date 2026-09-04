//
//  LoginViewModel.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import Foundation
import Observation

@Observable
final class LoginViewModel {

    var username = ""
    var password = ""
    var isLoggedIn = false
    var errorMessage = ""

    private let storage: UserStorageProtocol

    init(storage: UserStorageProtocol) {
        self.storage = storage
    }

    convenience init() {
        self.init(storage: UserStorageService())
    }

    func login() {

        // Validate input
        guard !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "username_required"
            isLoggedIn = false
            return
        }

        guard !password.isEmpty else {
            errorMessage = "password_required"
            isLoggedIn = false
            return
        }

        guard let savedUser = storage.getUser() else {
            errorMessage = "User Not Found"
            isLoggedIn = false
            return
        }

        if savedUser.username == username &&
            savedUser.password == password {

            isLoggedIn = true
            errorMessage = ""

        } else {
            isLoggedIn = false
            errorMessage = "Invalid Credentials"
        }
    }
}
