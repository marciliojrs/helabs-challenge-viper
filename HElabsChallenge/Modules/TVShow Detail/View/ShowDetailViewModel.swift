//
//  ShowDetailViewModel.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/5/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

struct ShowDetailEpisodeViewModel {
    
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id   = id
        self.name = name
    }
    
}

struct ShowDetailViewModel {
    
    let id: Int
    let name: String
    let posterURL: NSURL?
    let summary: String?
    let genres: [String]?
    let airOn: String?
    let sections: [Int: [ShowDetailEpisodeViewModel]]?
    let isFavorited: Bool
    
    init(id: Int, name: String, posterURL: NSURL?, summary: String?, genres: [String]?, airDays:[String]?, airTime: String?, episodes: [Episode]?, favorited: Bool) {
        self.id          = id
        self.name        = name
        self.posterURL   = posterURL
        self.summary     = summary
        self.genres      = genres
        self.isFavorited = favorited
        
        var days = airDays?.joinWithSeparator(",")
        if let d = days where d.characters.count > 0 {
            days = d.stringByAppendingString(" at ")
        }
        self.airOn  = days?.stringByAppendingString(airTime!)
        
        if let episodes = episodes {
            var seasons = [Int]()
            episodes.forEach { episode in
                if (!seasons.contains(episode.season)) {
                    seasons.append(episode.season)
                }
            }
            
            sections = [Int: [ShowDetailEpisodeViewModel]]()
            for season in seasons {
                let episodesPerSeason = episodes.filter({ (episode) -> Bool in
                    return episode.season == season
                })
                
                sections![season] = episodesPerSeason.map { episode -> ShowDetailEpisodeViewModel in
                    return ShowDetailEpisodeViewModel(id: episode.id, name: episode.name)
                }
            }
        }
        else {
            sections = nil
        }
    }
    
}
