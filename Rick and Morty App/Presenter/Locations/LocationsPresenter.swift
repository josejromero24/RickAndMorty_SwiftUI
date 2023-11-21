//
//  LocationsPresenter.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

protocol LocationsPresenterProtocol {
    func fetchLocations()
}


class LocationsPresenter: LocationsPresenterProtocol, ObservableObject {
     
    @Published var locations: [ResultsLocation] = []
    var page = 1 // First Page
    
    /*
     Method to fetch all the api data depending on the page number
     */
    func fetchLocations(){
        
        let apiUrl = "https://rickandmortyapi.com/api/location/?page=\(page)"
        AF.request(apiUrl).responseDecodable(of: ParentDataLocation.self) { response in
            switch response.result {
            case .success(let data):
                self.locations.append(contentsOf: data.results)
                self.page += 1 // Increment page
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
}

