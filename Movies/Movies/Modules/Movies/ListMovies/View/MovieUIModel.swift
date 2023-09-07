//
//  MovieUIModel.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import Foundation

struct MovieUIModel: Hashable, Identifiable {
    
    // MARK: - Properties
    var id = UUID()
    var movieId: Int?
    var imageURL: String?
    var name: String?
    var releaseYear: String?
    var overView: String?
    
    var year: String? {
        let value = releaseYear?.prefix(4)
        return String(value ?? "")
    }
}
