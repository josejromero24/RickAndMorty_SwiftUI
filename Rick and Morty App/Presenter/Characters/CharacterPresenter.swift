//
//  CharacterPresenter.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

protocol CharactersPresenterProtocol {
    func fetchCharacters()
    func getUrlImageFromCharacter(character: ResultsCharacter) -> URL
    func getFilteredItemsByName(searchText: String) -> [ResultsCharacter]
    
    func isFirstLoad()
    func isntFirstLoad()
}


class CharactersPresenter: CharactersPresenterProtocol, ObservableObject {
     
    @Published var characters: [ResultsCharacter] = []
    var page = 1 // First Page
    
    @Published var isLoading = false
    @Published var isFirstLoading = false

        func startLoading() { isLoading = true }
        func stopLoading() { isLoading = false }
    
    
    func isFirstLoad() { isFirstLoading = true }
    func isntFirstLoad() { isFirstLoading = false }
    
    /*
     Method to fetch all the api data depending on the page number
     */
    func fetchCharacters(){
        self.startLoading()
        if self.page == 1 { self.isFirstLoad() }
        let apiUrl = "https://rickandmortyapi.com/api/character?page=\(page)"
        AF.request(apiUrl).responseDecodable(of: ParentDataCharacter.self) { response in
            switch response.result {
            case .success(let data):
                self.characters.append(contentsOf: data.results)
                self.page += 1 // Increment page
                self.isntFirstLoad()
                    self.stopLoading()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
    /*
     Method to parse the url we get from the api which is String to URL
     @character = Results object as such, which we could say it is a Character
     @return = Returns a URL
     */
    func getUrlImageFromCharacter(character: ResultsCharacter) -> URL {
        var urlCharacterImage = URL(string: "https://www.google.com")!
        let urlString = character.image
        do {
            if let urlImage = try urlString?.asURL() {
                urlCharacterImage = urlImage
            }
        } catch let error {
            debugPrint("ERROR ::\(error)")
            
        }
        return urlCharacterImage
    }
    
    
    
    /*
     Method to filter Characters
     @searchText = The text string used in the searchBar.
     @return = If the string is Empty it will return the whole list, otherwise it will return the filtered results.
     */
    func getFilteredItemsByName(searchText: String) -> [ResultsCharacter]{
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
}
