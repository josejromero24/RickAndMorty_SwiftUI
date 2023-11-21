//
//  EpisodeDetails.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//

import Foundation

// MARK: - EpisodeDetails
struct EpisodeDetails: Codable {
    let id: Int
    let name, airDate, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
