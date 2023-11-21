//
//  Character.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//
import Foundation



// MARK: - ParentDataCharacter
struct ParentDataCharacter: Codable {
    let info: InfoCharacter
    let results: [ResultsCharacter]
}

// MARK: - InfoCharacter
struct InfoCharacter: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - ResultsCharacter
struct ResultsCharacter: Identifiable, Decodable, Encodable, Equatable {
    let id: Int
    let name: String
    let image: String?
    let status: Status?
    let url: String?
    
}

// MARK: - Status
enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
