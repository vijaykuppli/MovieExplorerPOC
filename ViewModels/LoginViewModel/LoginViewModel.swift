//
//  LoginViewModel.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {

    @Published var username = ""
    @Published var password = ""

    @Published var isLoggedIn = false
    @Published var errorMessage = ""

    private let storage = UserStorageService()

    func login() {

        guard let user = storage.getUser() else {
            errorMessage = "User not found"
            return
        }

        if user.username == username &&
            user.password == password {

            isLoggedIn = true

        } else {

            errorMessage = "Invalid credentials"
        }
    }
}
