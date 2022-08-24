//
//  HexColor.swift
//  InstagramProfilePage
//
//  Created by Neal Archival on 8/22/22.
//

import SwiftUI

extension Color {
    public static let linkBlue = Color("LinkColor")
    public static let appGray = Color("AppGray")
    public static let appBackground = Color("AppBackground")
    public static let tabItemGray = Color("TabItemGray")
    // Custom initializer than accepts a hexadecimal
    init(hex: Int, opacity: Double = 1.0) {
        // Note: 0xff = 255
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
