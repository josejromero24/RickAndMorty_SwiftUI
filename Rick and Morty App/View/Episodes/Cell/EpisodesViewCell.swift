//
//  EpisodesViewCell.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//

import Foundation
import SwiftUI

struct EpisodesViewCell: View {
    var name: String
    var air_date: String
    var episode: String
    
    init(name: String, air_date: String, episode: String) {
        self.name = name
        self.air_date = air_date
        self.episode = episode
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("**Name:**  \(self.name)").frame(minWidth: 300, alignment: .leading)
            Text("**Air Date:**  \(self.air_date)").frame(minWidth: 300, alignment: .leading)
            Text("**Episode:**  \(getSeasonAndEpisode(episode: self.episode))").frame(minWidth: 300, alignment: .leading)
        }.padding()
    }
    
}

struct EpisodesViewCell_Previews: PreviewProvider {
    
    static var previews: some View {
        EpisodesViewCell(name: "Pilot",
                         air_date: "December 2, 2013",
                         episode: "S01E01")
    }
}
