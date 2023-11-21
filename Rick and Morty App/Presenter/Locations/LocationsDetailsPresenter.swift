//
//  LocationsDetailsPresenter.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

protocol LocationsDetailsPresenterProtocol {
    func fetchDetailLocation(locationUrl: String)
    func getLocationDetails() -> LocationDetails
    func getCharactersResidentDetail() -> [CharacterDetail]
}


class LocationsDetailsPresenter: LocationsDetailsPresenterProtocol,ObservableObject {
    @Published var locationDetails: LocationDetails = LocationDetails(id: 0, name: "", type: "", dimension: "", residents: [""], url: "", created: "")
    var characterResidentList: [String] = []
    @Published var charactersResidentDetail: [CharacterDetail] = []
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
    func fetchDetailLocation(locationUrl: String) {
        self.startLoading()
        AF.request(locationUrl).responseDecodable(of: LocationDetails.self) { response in
            switch response.result {
            case .success(let data):
                self.locationDetails = data
                self.characterResidentList = data.residents
                
                for element in self.characterResidentList {
                    self.getDataFromResidents(residentsUrl: element)
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
    
}

