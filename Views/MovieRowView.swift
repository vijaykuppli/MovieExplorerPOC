//
//  MovieRowView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import SwiftUI

struct MovieRowView: View {

    let movie: Movie

    var body: some View {
        Text(movie.title)
            .font(.headline)
    }
}
