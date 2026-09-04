//
//  LoginViewModelTests.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 04/09/26.
//
import XCTest
@testable import MovieExplorer

final class MockUserStorage: UserStorageProtocol {

    var user: User?

    func saveUser(_ user: User) {
        self.user = user
    }

    func getUser() -> User? {
        return user
    }
}

@MainActor
final class LoginViewModelTests: XCTestCase {

    func testLoginWithValidCredentials() {

        // Given
        let storage = MockUserStorage()

        storage.user = User(
            username: "vijay",
            password: "123456"
        )

        let viewModel = LoginViewModel(storage: storage)

        viewModel.username = "vijay"
        viewModel.password = "123456"

        // When
        viewModel.login()

        // Then
        XCTAssertTrue(viewModel.isLoggedIn)
        XCTAssertEqual(viewModel.errorMessage, "")
    }
    func testLoginWithInvalidCredentials() {

        // Given
        let storage = MockUserStorage()

        storage.user = User(
            username: "vijay",
            password: "123456"
        )

        let viewModel = LoginViewModel(storage: storage)

        viewModel.username = "vijay"
        viewModel.password = "wrongpassword"

        // When
        viewModel.login()

        // Then
        XCTAssertFalse(viewModel.isLoggedIn)
        XCTAssertEqual(viewModel.errorMessage, "Invalid Credentials")
    }
    func testLoginWhenUserDoesNotExist() {

        // Given
        let storage = MockUserStorage()

        storage.user = nil

        let viewModel = LoginViewModel(storage: storage)

        viewModel.username = "vijay"
        viewModel.password = "123456"

        // When
        viewModel.login()

        // Then
        XCTAssertFalse(viewModel.isLoggedIn)
        XCTAssertEqual(viewModel.errorMessage, "user_not_found")
    }
    func testLoginWithEmptyUsername() {
        let storage = MockUserStorage()

        let viewModel = LoginViewModel(storage: storage)
        viewModel.username = ""
        viewModel.password = "123456"

        viewModel.login()

        XCTAssertFalse(viewModel.isLoggedIn)
        XCTAssertEqual(viewModel.errorMessage, "username_required")
    }

    func testLoginWithEmptyPassword() {
        let storage = MockUserStorage()

        let viewModel = LoginViewModel(storage: storage)
        viewModel.username = "vijay"
        viewModel.password = ""

        viewModel.login()

        XCTAssertFalse(viewModel.isLoggedIn)
        XCTAssertEqual(viewModel.errorMessage, "password_required")
    }
}
