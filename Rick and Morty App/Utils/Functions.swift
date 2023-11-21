//
//  Functions.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//

import Foundation


func getSeasonAndEpisode(episode: String) -> String{
        var result = ""
    let episodeArr = episode.components(separatedBy: "E")

    result = "Season \(episodeArr.first?.dropFirst() ?? "") - Episode \(episodeArr.last ?? "")"
    
    return result
}
