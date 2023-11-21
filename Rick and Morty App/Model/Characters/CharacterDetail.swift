//
//  CharacterDetail.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//

import Foundation


// MARK: - CharacterDetail
struct CharacterDetail: Codable, Identifiable {
    let id: Int
    let name, status, species, type: String?
    let gender: String?
    let origin, location: LocationCharacterDetail?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - LocationCharacterDetail
struct LocationCharacterDetail: Codable {
    let name: String?
    let url: String?
}
