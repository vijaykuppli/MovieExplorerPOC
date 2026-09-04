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

        guard let savedUser =
                UserStorageService().getUser()
            else {

                errorMessage = "User not found"
                return
            }

            if savedUser.username == username &&
                savedUser.password == password {

                isLoggedIn = true
                errorMessage = ""

            } else {

                errorMessage = "Invalid credentials"
        }
    }
}
