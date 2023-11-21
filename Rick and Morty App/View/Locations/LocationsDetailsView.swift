//
//  LocationsDetailsView.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//

import SwiftUI

struct LocationsDetailsView: View {
    @ObservedObject var presenter: LocationsDetailsPresenter
    @State var locationUrl: String = ""
    
    
    var body: some View {
        
        VStack {
            
            let locationDetail = presenter.getLocationDetails()
            
            
            Text(locationDetail.name).font(.largeTitle).foregroundColor(Color.gray)
            
            Divider().frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(20)
            
            VStack(spacing: 20) {
                
                EmbedLocationDetailsView(iconTitle: "Type: 🌐", subTitle: "\(locationDetail.type) ")
                    .frame(maxWidth:.infinity)
                
                EmbedLocationDetailsView(iconTitle: "Dimension: 🔭", subTitle: "\(locationDetail.dimension) ")
                    .frame(maxWidth:.infinity)
            }
            
            .padding()
            
            List {
                Section(header: Text("Locations")) {
                    
                    if presenter.isLoading{
                        ProgressView("Loading...")
                    } else {
                        if presenter.locationDetails.residents.count <= 0 {
                            
                            HStack(alignment: .center) {
                                Image(systemName: "exclamationmark.triangle")
                                Text("Uuups!").font(.footnote)
                                Text("There are no locations in this \(presenter.locationDetails.type)")
                                    .font(.footnote)
                            } .foregroundColor(Color.black)
                            
                        } else {
                            
                            ForEach(presenter.getCharactersResidentDetail()) { residentDetails in
                                
                                NavigationLink(destination: CharactersDetailsView(presenter: CharactersDetailsPresenter(), characterUrl: residentDetails.url ?? "")){
                                    
                                    LocationsResidentsDetails(image: residentDetails.image ?? "", name: residentDetails.name ?? "", bornIn: residentDetails.origin?.name ?? "").frame(maxWidth:.infinity).padding(10)
                                    
                                }
                            }
                        }
                    }
                }
                
            }
            
        }
        
        .navigationBarTitle("", displayMode: .inline)
        
        .onAppear {
            if !self.locationUrl.isEmpty {
                presenter.fetchDetailLocation(locationUrl: self.locationUrl)
            }
        }
    }
}


/*
 struct LocationsDetailsView_Previews: PreviewProvider {
 static var previews: some View {
 let locationUrl = "JTEST URL"
 let presenter = LocationsDetailsPresenter()
 return LocationsDetails(presenter: LocationsDetailsPresenter())
 }
 }
 */
