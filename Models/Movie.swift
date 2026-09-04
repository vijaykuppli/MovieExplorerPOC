//
//  Movie.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//
import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let imageName: String
    let backgroundColor: String
    let imageUrl: String
    var isFavorite: Bool = false
}

