//
//  EpisodesPresenter.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//


import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

protocol EpisodesPresenterProtocol {
    func fetchEpisodes()
}


class EpisodesPresenter: EpisodesPresenterProtocol, ObservableObject {
     
    @Published var episodes: [ResultEpisode] = []
    var page = 1 // First Page
    
    /*
     Method to fetch all the api data depending on the page number
     */
    func fetchEpisodes(){
        let apiUrl = "https://rickandmortyapi.com/api/episode/?page=\(page)"
        AF.request(apiUrl).responseDecodable(of: ParentDataEpisode.self) { response in
            switch response.result {
            case .success(let data):
                self.episodes.append(contentsOf: data.results)
                self.page += 1 // Increment page
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
}

