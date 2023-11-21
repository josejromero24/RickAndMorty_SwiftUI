//
//  Episode.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//

import Foundation

// MARK: - ParentDataEpisode
struct ParentDataEpisode: Codable {
    let info: InfoEpisode
    let results: [ResultEpisode]
}

// MARK: - InfoEpisode
struct InfoEpisode: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

// MARK: - ResultEpisode
struct ResultEpisode: Codable, Identifiable,Equatable  {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
