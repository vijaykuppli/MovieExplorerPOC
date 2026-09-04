//
//  UserStorageProtocol.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 04/09/26.
//

import Foundation

protocol UserStorageProtocol {
    func saveUser(_ user: User)
    func getUser() -> User?
}
