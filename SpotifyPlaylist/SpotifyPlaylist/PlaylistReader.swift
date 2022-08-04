//
//  PlaylistReader.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/1/22.
//

import Foundation

func readPlaylist() -> Playlist? {
    let filename = "KimBops"
    let fileURL = Bundle.main.url(forResource: filename, withExtension: "json")!
    do {
        let jsonData = try Data(contentsOf: fileURL)
        let playlist = try JSONDecoder().decode(Playlist.self, from: jsonData)
        return playlist
    } catch let error {
        print("Decode error")
        print(error.localizedDescription)
        return nil
    }
}
