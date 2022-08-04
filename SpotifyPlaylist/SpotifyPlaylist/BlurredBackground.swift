//
//  BlurredBackground.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/2/22.
//

import Foundation
import SwiftUI

struct BlurredBackground: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Do nothing
    }
}
