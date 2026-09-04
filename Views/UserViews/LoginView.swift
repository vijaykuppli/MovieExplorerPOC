//
//  LoginView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import SwiftUI

struct LoginView: View {

    @State private var viewModel = LoginViewModel()

    @AppStorage("isLoggedIn")
    private var isLoggedIn = false

    var body: some View {

        NavigationStack {

            VStack(spacing: AppConstants.Spacing.large) {

                @Bindable var viewModel = viewModel

                TextField(
                    "username_placeholder",
                    text: $viewModel.username
                )
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

                SecureField(
                    "password_placeholder",
                    text: $viewModel.password
                )
                .textFieldStyle(.roundedBorder)

                Button("login_title") {
                    viewModel.login()

                    if viewModel.isLoggedIn {
                        isLoggedIn = true
                    }
                }

                if !viewModel.errorMessage.isEmpty {
                    Text(LocalizedStringKey(viewModel.errorMessage))
                        .foregroundStyle(.red)
                }

                NavigationLink(
                    "register_title",
                    destination: RegisterView()
                )
            }
            .padding()
            .navigationTitle("login_title")
            .navigationDestination(
                isPresented: $viewModel.isLoggedIn
            ) {
                HomeView()
            }
        }
    }
}
