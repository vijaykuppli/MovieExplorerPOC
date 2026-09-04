//
//  MovieService.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//
import Foundation
import SwiftUI
class MovieService {

    func fetchMovies() async throws -> [Movie] {

        return [
            Movie(id: 1, title: "Irumudi", imageName: "Irumudi", backgroundColor: "red", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 2, title: "RRR", imageName: "RRR", backgroundColor: "accent", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 3, title: "Pushpa", imageName: "Pushpa", backgroundColor: "orange", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 4, title: "Skanda", imageName: "Skanda", backgroundColor: "purple", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 5, title: "Dhurandar", imageName: "Dhurandar", backgroundColor: "blue", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 6, title: "Raja", imageName: "Raja", backgroundColor: "yellow", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 7, title: "Pushpa 2", imageName: "Pushpa 2", backgroundColor: "cyan", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 8, title: "Chennai Love Story", imageName: "Chennai Love Story", backgroundColor: "black", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 9, title: "Mukunda", imageName: "Mukunda", backgroundColor: "brown", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 10, title: "Peddi", imageName: "Peddi", backgroundColor: "clear", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 11, title: "Shiva Shankar Vara Prasad", imageName: "Shiva Shankar Vara",backgroundColor:"gray", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 12, title: "Raja Saab", imageName: "Raja Saab", backgroundColor: "green", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 13, title: "Ustad", imageName: "Ustad", backgroundColor: "indigo", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 14, title: "OG", imageName: "OG", backgroundColor: "mint", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 15, title: "Ma Inti Bangaram", imageName: "Ma Inti Bangaram", backgroundColor: "pink", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 16, title: "Rakasa", imageName: "Rakasa", backgroundColor: "secondary", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 17, title: "Rakasa", imageName: "Rakasa", backgroundColor: "secondary", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 18, title: "Vishnu Vinyasam", imageName: "Vishnu Vinyasam", backgroundColor: "teal", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 18, title: "Vishnu Vinyasam", imageName: "Vishnu Vinyasam", backgroundColor: "teal", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 19, title: "Siddhartha", imageName: "Siddhartha", backgroundColor: "white", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 20, title: "Madham", imageName: "Madham", backgroundColor: "red", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 21, title: "45", imageName: "45", backgroundColor: "red", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 22, title: "Veershankar", imageName: "Veershankar", backgroundColor: "red", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 23, title: "Neelakanta", imageName: "Neelakanta", backgroundColor: "red", imageUrl: "https://picsum.photos/200/300",),
            Movie(id: 24, title: "Pushpa", imageName: "Pushpa", backgroundColor: "red", imageUrl: "https://picsum.photos/200/300",)
        ]
    }
}
