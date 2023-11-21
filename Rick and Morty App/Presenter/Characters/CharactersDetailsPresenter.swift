//
//  CharactersDetailsPresenter.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 5/11/23.
//

import Foundation
import Alamofire

protocol CharactersDetailsPresenterProtocol {
    func fetchDetailsOfCharacters(characterUrl: String)
}


class CharactersDetailsPresenter: CharactersDetailsPresenterProtocol,ObservableObject {
    
    @Published var characterDetail: CharacterDetail = CharacterDetail(id: 0, name: "", status: "", species: "", type: "", gender: "", origin: LocationCharacterDetail(name: "", url: ""), location: LocationCharacterDetail(name: "", url: ""), image: "", episode: [""], url: "", created: "")
    
    
    @Published var isLoading = false

        func startLoading() { isLoading = true }
        func stopLoading() { isLoading = false }
    
    /*
     
     Method to fetch all the character api data
     */
    
    func fetchDetailsOfCharacters(characterUrl: String){
        self.startLoading()
        AF.request(characterUrl).responseDecodable(of: CharacterDetail.self) { response in
            switch response.result {
            case .success(let data):
                self.characterDetail = data
                self.stopLoading()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
    
    
    
    
    
    
    
    
    /*
    
    /*
     Method to return the details of the location obtained.
     */
    func getLocationDetails() -> LocationDetails{
        return locationDetails
    }
    
    
    
    func getDataFromResidents(residentsUrl: String){
        AF.request(residentsUrl).responseDecodable(of: CharacterDetail.self) { response in
            switch response.result {
            case .success(let data):
                
                if !self.charactersResidentDetail.contains(where: { $0.id == data.id}) {
                    self.charactersResidentDetail.append(data)
                }

                
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
        
    }
    
    func getCharactersResidentDetail() -> [CharacterDetail] {
        return charactersResidentDetail
        
    }
    
     */
}

