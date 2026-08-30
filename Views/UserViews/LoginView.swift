//
//  LoginView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import SwiftUI

struct LoginView: View {

    @StateObject private var viewModel = LoginViewModel()
    @AppStorage("isLoggedIn")
    private var isLoggedIn = false
    
    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                TextField(
                    "Username",
                    text: $viewModel.username
                )
                .textFieldStyle(.roundedBorder)

                SecureField(
                    "Password",
                    text: $viewModel.password
                )
                .textFieldStyle(.roundedBorder)

                Button("Login") {
                    viewModel.login()
                    if viewModel.isLoggedIn {
                           isLoggedIn = true
                       }
                }

                Text(viewModel.errorMessage)
                    .foregroundStyle(.red)

                NavigationLink(
                    "Register",
                    destination: RegisterView()
                )
            }
            .padding()
            .navigationDestination(
                isPresented: $viewModel.isLoggedIn
            ) {
                HomeView()
            }
        }
    }
}
