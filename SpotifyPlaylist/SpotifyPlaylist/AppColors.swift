//
//  AppColors.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/1/22.
//

import SwiftUI

extension Color {
    public static let SpotifyGreen = Color("SpotifyGreen")
    public static let SpotifyBlack = Color("SpotifyBlack")
    public static let LighterBlack = Color("LighterBlack")
    
    init(hex: Int, opacity: Double = 1.0) {
         let red = Double((hex & 0xff0000) >> 16) / 255.0
         let green = Double((hex & 0xff00) >> 8) / 255.0
         let blue = Double((hex & 0xff) >> 0) / 255.0
         self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
     }
}
