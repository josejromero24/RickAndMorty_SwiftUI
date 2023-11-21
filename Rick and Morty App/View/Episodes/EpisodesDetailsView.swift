//
//  EpisodesDetailsView.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//

import SwiftUI

struct EpisodesDetailsView: View {
    @ObservedObject var presenter: EpisodesDetailsPresenter
    @State var episodesUrl: String = ""
    
    
    
    var body: some View {
        
        VStack {
                
                let episodeDetail = presenter.getEpisodesDetails()
                
                Text(episodeDetail.name ?? "").font(.largeTitle).foregroundColor(Color.gray)
                
                Divider().frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(20)
                
                VStack(spacing: 20) {
                    EmbedLocationDetailsView(iconTitle: "Air Date: 📅", subTitle: "\(episodeDetail.airDate ?? "")")
                        .frame(maxWidth:.infinity)
                    EmbedLocationDetailsView(iconTitle: "Episode: 📺", subTitle: "\(getSeasonAndEpisode(episode: episodeDetail.episode ?? ""))")
                        .frame(maxWidth:.infinity)
                    EmbedLocationDetailsView(iconTitle: "Total characters: 👪", subTitle: "\(episodeDetail.characters?.count ?? 0) ")
                        .frame(maxWidth:.infinity)
                }
                .padding()
                
                List {
                    Section(header: Text("Characters")) {
                        
                        if presenter.isLoading{
                            ProgressView("Loading...")
                        } else {
                            if presenter.episodeDetails.characters?.count ?? 0 <= 0 {
                                HStack(alignment: .center) {
                                    Image(systemName: "exclamationmark.triangle")
                                    Text("Uuups!").font(.footnote)
                                        .font(.footnote)
                                } .foregroundColor(Color.black)
                                
                            } else {
                                
                                ForEach(presenter.getDataFromCharacters()) { characterDetails in
                                    
                                    NavigationLink(destination: CharactersDetailsView(presenter: CharactersDetailsPresenter(), characterUrl: characterDetails.url ?? "")){
                                        
                                        LocationsResidentsDetails(image: characterDetails.image ?? "", name: characterDetails.name ?? "", bornIn: characterDetails.origin?.name ?? "").frame(maxWidth:.infinity).padding(10)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            
        }
        .navigationBarTitle("", displayMode: .inline)
        
        .onAppear {
            if !self.episodesUrl.isEmpty {
                presenter.fetchDetailEpisode(episodeUrl: self.episodesUrl)
            }
            
        }
        
    }
}


/*
 struct EpisodesDetailsView_Previews: PreviewProvider {
 static var previews: some View {
 let episodesUrl = "JTEST URL"
 let presenter = LocationsDetailsPresenter()
 return LocationsDetails(presenter: LocationsDetailsPresenter())
 }
 }
 */
