//
//  EpisodesDetailsPresenter.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

protocol EpisodeDetailsPresenterProtocol {
    func fetchDetailEpisode(episodeUrl: String)
    func getEpisodesDetails() -> EpisodeDetails

    func getDataFromCharacters() -> [CharacterDetail]
}


class EpisodesDetailsPresenter: EpisodeDetailsPresenterProtocol,ObservableObject {
    @Published var episodeDetails: EpisodeDetails = EpisodeDetails(id: 0, name: "", airDate: "", episode: "", characters: [""], url: "", created: "")
    var episodeCharacterList: [String] = []
    @Published var episodeCharactersDetail: [CharacterDetail] = []
    @Published var isLoading = false

    
    func startLoading() {
        isLoading = true
    }

    func stopLoading() {
        isLoading = false
    }


    /*
     
     Method to fetch all the api data depending on the url
     */
    func fetchDetailEpisode(episodeUrl: String) {
        self.startLoading()
        AF.request(episodeUrl).responseDecodable(of: EpisodeDetails.self) { response in
            switch response.result {
            case .success(let data):
                self.episodeDetails = data
                self.episodeCharacterList = data.characters ?? [""]
                
                for element in self.episodeCharacterList {
                    self.getDataFromCharacters(charactersUrl: element)
                }
                    self.stopLoading()
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
    
    /*
     Method to return the details of the location obtained.
     */
    func getEpisodesDetails() -> EpisodeDetails{
        return episodeDetails
    }
    
    
    func getDataFromCharacters(charactersUrl: String){
        AF.request(charactersUrl).responseDecodable(of: CharacterDetail.self) { response in
            switch response.result {
            case .success(let data):
                
                if !self.episodeCharactersDetail.contains(where: { $0.id == data.id}) {
                    self.episodeCharactersDetail.append(data)
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
    
    
    func getDataFromCharacters() -> [CharacterDetail] {
        return episodeCharactersDetail
    }
    
    func getIsLoadingStatus() -> Bool {
        return isLoading
    }
    
}

