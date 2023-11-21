//
//  Location.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//

import Foundation

// MARK: - ParentDataLocation
struct ParentDataLocation: Codable {
    let info: InfoLocation
    let results: [ResultsLocation]
}

// MARK: - InfoLocation
struct InfoLocation: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - ResultsLocation
struct ResultsLocation: Codable, Identifiable,Equatable, Hashable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
