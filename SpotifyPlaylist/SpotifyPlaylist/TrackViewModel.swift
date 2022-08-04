//
//  TrackViewModel.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/2/22.
//

import Foundation

extension TrackView {
    @MainActor final class ViewModel: ObservableObject {
        @Published var liked: Bool
        @Published var optionsActive: Bool
        
        init() {
            self.liked = false
            self.optionsActive = false
        }
        
        init(liked: Bool, optionsActive: Bool) {
            self.liked = liked
            self.optionsActive = optionsActive
        }
    }
}
