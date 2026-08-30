//
//  RegisterViewModel.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {

    @Published var username = ""
    @Published var password = ""

    private let storage = UserStorageService()

    func register() {

        let user = User(
            username: username,
            password: password
        )

        storage.saveUser(user)
    }
}
