//
//  LocationDetails.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//

import Foundation

// MARK: - LocationDetails
struct LocationDetails: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
