//
//  RegisterViewModelTests.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 04/09/26.
//

import XCTest
@testable import MovieExplorer

@MainActor
final class RegisterViewModelTests: XCTestCase {

    func testRegisterUser() {

        // Given
        let storage = MockUserStorage()

        let viewModel = RegisterViewModel(
            storage: storage
        )

        viewModel.username = "vijay"
        viewModel.password = "123456"

        // When
        viewModel.register()

        // Then
        XCTAssertNotNil(storage.user)
        XCTAssertEqual(storage.user?.username, "vijay")
        XCTAssertEqual(storage.user?.password, "123456")
    }
    func testRegisterSavesEnteredCredentials() {

        // Given
        let storage = MockUserStorage()

        let viewModel = RegisterViewModel(
            storage: storage
        )

        viewModel.username = "testuser"
        viewModel.password = "password123"

        // When
        viewModel.register()

        // Then
        XCTAssertEqual(storage.user?.username, viewModel.username)
        XCTAssertEqual(storage.user?.password, viewModel.password)
    }
    func testRegisterWithEmptyUsername() {
        let storage = MockUserStorage()

        let viewModel = RegisterViewModel(storage: storage)
        viewModel.username = ""
        viewModel.password = "123456"

        viewModel.register()

        XCTAssertFalse(viewModel.registrationSuccessful)
        XCTAssertEqual(viewModel.errorMessage, "username_required")
    }

    func testRegisterWithEmptyPassword() {
        let storage = MockUserStorage()

        let viewModel = RegisterViewModel(storage: storage)
        viewModel.username = "vijay"
        viewModel.password = ""

        viewModel.register()

        XCTAssertFalse(viewModel.registrationSuccessful)
        XCTAssertEqual(viewModel.errorMessage, "password_required")
    }

    func testRegisterWithShortPassword() {
        let storage = MockUserStorage()

        let viewModel = RegisterViewModel(storage: storage)
        viewModel.username = "vijay"
        viewModel.password = "123"

        viewModel.register()

        XCTAssertFalse(viewModel.registrationSuccessful)
        XCTAssertEqual(viewModel.errorMessage, "password_minimum_length")
    }
}
