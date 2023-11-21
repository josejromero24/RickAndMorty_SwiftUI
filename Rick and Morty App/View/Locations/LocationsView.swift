//
//  LocationsView.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//
import SwiftUI

struct LocationsView: View {
    @ObservedObject var presenter: LocationsPresenter
    
    var body: some View {
     
        NavigationView {
            
                List(presenter.locations){ location in
                    
                    NavigationLink(destination: LocationsDetailsView(presenter: LocationsDetailsPresenter(), locationUrl: location.url)){
                        
                        LocationsViewCell(name: location.name, type: location.type, dimension: location.dimension)
                        
                    }
                    // To check if the element is the last one so that more data can be uploaded
                    .onAppear {
                        if location == presenter.locations.last {
                            presenter.fetchLocations()
                        }
                    }
                }.listStyle(PlainListStyle())
                .navigationBarTitle("Locations")
                .navigationBarBackButtonHidden(true)
        }
        .onAppear {
            presenter.fetchLocations()
        }
        
    }
}


struct LocationsView_Previews: PreviewProvider{
    static var previews: some View {
        LocationsView(presenter: LocationsPresenter())
    }
}


