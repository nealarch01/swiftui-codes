//
//  ContentViewModel.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/1/22.
//

import Foundation

extension ContentView {
    @MainActor final class ViewModel: ObservableObject {
        let playlist = readPlaylist()!
    }
}
