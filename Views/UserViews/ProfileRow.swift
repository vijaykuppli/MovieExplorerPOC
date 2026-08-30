//
//  ProfileRow.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 30/08/26.
//
import SwiftUI

struct ProfileRow: View {

    let icon: String
    let title: String

    var body: some View {

        HStack {
            Text(title)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
