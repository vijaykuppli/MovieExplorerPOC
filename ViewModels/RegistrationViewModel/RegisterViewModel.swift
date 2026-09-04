//
//  RegisterViewModel.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import Foundation
import Observation

@Observable
final class RegisterViewModel {

    var username = ""
    var password = ""
    var errorMessage = ""
    var registrationSuccessful = false

    private let storage: UserStorageProtocol

    init(storage: UserStorageProtocol) {
        self.storage = storage
    }

    convenience init() {
        self.init(storage: UserStorageService())
    }

    func register() {

        // Validate username
        guard !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Username Required"
            registrationSuccessful = false
            return
        }

        // Validate password
        guard !password.isEmpty else {
            errorMessage = "Password Required"
            registrationSuccessful = false
            return
        }

        // Minimum password length
        guard password.count >= 6 else {
            errorMessage = "Password Minimum Length"
            registrationSuccessful = false
            return
        }

        let user = User(
            username: username.trimmingCharacters(in: .whitespacesAndNewlines),
            password: password
        )

        storage.saveUser(user)

        errorMessage = ""
        registrationSuccessful = true
    }
}
