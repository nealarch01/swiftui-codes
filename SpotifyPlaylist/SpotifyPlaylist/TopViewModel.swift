//
//  TopViewModel.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/3/22.
//

import Foundation

extension TopView {
    @MainActor final class ViewModel: ObservableObject {
        @Published var receivedAPIColor: Bool = false
        private(set) var vibrantColor: Int = 0x191414 // Default
        
        func fetchColorData(imageURL: String) async -> Void {
            let colorData = await ImageColor().getVibrant(imageURL: imageURL)
            if colorData != nil {
                self.vibrantColor = colorData!.hexValue ?? 0x191414
                self.receivedAPIColor = true
            } else {
                print("Could not set background image.")
            }
        }
    }
}
