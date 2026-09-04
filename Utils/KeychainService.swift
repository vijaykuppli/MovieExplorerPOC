//
//  KeychainService.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 04/09/26.
//

import Foundation
import Security

class KeychainService {

    static let shared = KeychainService()

    private init() {}

    func savePassword(
        username: String,
        password: String
    ) {

        let data = password.data(using: .utf8)!

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username
        ]

        SecItemDelete(query as CFDictionary)

        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
            kSecValueData as String: data
        ]

        SecItemAdd(attributes as CFDictionary, nil)
    }

    func getPassword(
        username: String
    ) -> String? {

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var item: AnyObject?

        let status = SecItemCopyMatching(
            query as CFDictionary,
            &item
        )

        guard
            status == errSecSuccess,
            let data = item as? Data
        else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }
}
