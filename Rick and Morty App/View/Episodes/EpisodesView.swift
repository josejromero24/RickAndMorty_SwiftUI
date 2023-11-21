//
//  EpisodesView.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//
import SwiftUI

struct EpisodesView: View {
    @ObservedObject var presenter: EpisodesPresenter
    
    var body: some View {
        NavigationView {
            List(presenter.episodes) { episode in
                
                NavigationLink(destination: EpisodesDetailsView(presenter: EpisodesDetailsPresenter(), episodesUrl: episode.url)) {
                    
                    EpisodesViewCell(name: episode.name, air_date: episode.airDate, episode: episode.episode)
                    
                }
                
                // To check if the element is the last one so that more data can be uploaded
                .onAppear {
                    if episode == presenter.episodes.last {
                        presenter.fetchEpisodes()
                    }
                }
            }.listStyle(PlainListStyle())
                .navigationBarTitle("Episodes")
                .navigationBarBackButtonHidden(true)
            
        }
        // To load data for the first time
        .onAppear {
            presenter.fetchEpisodes()
        }
        
    }
    
}


struct EpisodesView_Previews: PreviewProvider{
    static var previews: some View {
        EpisodesView(presenter: EpisodesPresenter())
    }
}


