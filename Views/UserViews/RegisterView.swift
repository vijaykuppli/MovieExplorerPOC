//
//  RegistrationView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//
import SwiftUI

struct RegisterView: View {

    @State private var viewModel = RegisterViewModel()

    @Environment(\.dismiss) private var dismiss

    var body: some View {

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

            Button("register_title") {
                viewModel.register()

                if viewModel.registrationSuccessful {
                    dismiss()
                }
            }

            if !viewModel.errorMessage.isEmpty {
                Text(LocalizedStringKey(viewModel.errorMessage))
                    .foregroundStyle(.red)
            }
        }
        .padding()
        .navigationTitle("register_title")
    }
}
