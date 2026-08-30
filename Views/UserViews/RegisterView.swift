//
//  RegistrationView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//
import SwiftUI

struct RegisterView: View {

    @StateObject private var viewModel = RegisterViewModel()

    var body: some View {

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

            Button("Register") {
                viewModel.register()
            }
        }
        .padding()
    }
}
