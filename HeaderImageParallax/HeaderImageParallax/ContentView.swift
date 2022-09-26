//
//  ContentView.swift
//  HeaderImageParallax
//
//  Created by Neal Archival on 8/3/22.
//

import SwiftUI

// .offset(y: geometry.frame(in: .global).minY > 0 ? -geometry.frame(in: .global).minY : 0)

struct ContentView: View {
    private let defaultPicSize: CGFloat = 250
    private let maxPicSize: CGFloat = 250 * 2
    private var yOffset: CGFloat = 0.0
    var body: some View {
        ZStack {
            GeometryReader { rootGeometry in
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 0) {
                        GeometryReader { geometry in
                            Image("coffee-icon")
                                .resizable()
                                .frame(width: calculateParallax(minY: geometry.frame(in: .global).minY), height: calculateParallax(minY: geometry.frame(in: .global).minY))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray)
                                }
                                .offset(y: rootGeometry.safeAreaInsets.top + 20) // Offset down + safeAreaInser top + a little
                                // minY Increases going down
                                // minY Decreases going up
                                // Negative to negate overscroll
                                .offset(y: calculateOffset(minY: geometry.frame(in: .global).minY))
                                .frame(width: geometry.size.width, height: geometry.size.height) // Centers on x axis
                        }
                        .frame(height: 300)
                    } // VStack
                } // ScrollView
            }
        } // ZStack
    }
    
    private func calculateParallax(minY: CGFloat) -> CGFloat {
//        print(minY)
        let calculatedSize = 250 + minY
        if calculatedSize > maxPicSize { // Do not continue scaling image
            return maxPicSize
        }
        return calculatedSize
    }
    
    private func calculateOffset(minY: CGFloat) -> CGFloat {
        if minY >= 0.0 { // If scrolling up
            return -minY // Negate up scroll
        }
        return minY // If scrolling down, continue regularly
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
