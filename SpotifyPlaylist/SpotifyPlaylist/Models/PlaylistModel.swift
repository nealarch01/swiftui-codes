//
//  Playlist.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/1/22.
//

import Foundation

class Playlist: Decodable {
    let name: String
    let description: String
    let images: Array<Covers>
    let tracks: Tracks
    let followers: Followers
    let owner: Owner
    
    init() {
        self.name = ""
        self.description = ""
        self.images = [Covers()]
        self.tracks = Tracks()
        self.followers = Followers()
        self.owner = Owner()
    }
    
    public func calcTotalDuration() -> String {
        let hr_to_ms = 3600000
        let min_to_ms = 60000
        
        var totalDuration_ms = 0
        
        for item in self.tracks.items {
            totalDuration_ms += item.track.duration_ms
        }
        
        var timeString = ""
        let hours = totalDuration_ms / hr_to_ms

        if hours > 0 {
            timeString += "\(hours)h"
        }
        
        let minutes = (totalDuration_ms % hr_to_ms) / min_to_ms // Take the remainder
        if minutes > 0 {
            timeString += " \(minutes)m"
        }
        
        return timeString
    }
}

class Followers: Decodable {
    let total: Int
    
    init() {
        self.total = 0
    }
}

class Owner: Decodable {
    let display_name: String
    
    init() {
        self.display_name = ""
    }
}

class Tracks: Decodable {
    let items: Array<Item>
    
    init() {
        self.items = []
    }
}

class Item: Decodable {
    let track: Track
    
    init() {
        self.track = Track()
    }
}

class Track: Decodable {
    let name: String
    let preview_url: String?
    let album: Album
    let duration_ms: Int
    let explicit: Bool
    
    init() {
        self.name = ""
        self.preview_url = ""
        self.album = Album()
        self.duration_ms = 0
        self.explicit = false
    }
}

class Album: Decodable {
    let id: String
    let name: String // Album name
    let artists: Array<Artists>
    let images: Array<Covers>
    
    init() {
        self.id = ""
        self.name = ""
        self.artists = []
        self.images = [Covers()]
    }
}

class Artists: Decodable {
    let name: String
    
    init() {
        self.name = ""
    }
}

class Covers: Decodable {
    let url: String
    
    init() {
        self.url = "https://i.scdn.co/image/ab67616d0000b27317db30ce3f081d6818a8ad49"
    }
}
