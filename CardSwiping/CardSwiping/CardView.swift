//
//  CardView.swift
//  CardSwiping
//
//  Created by Neal Archival on 8/4/22.
//

import SwiftUI

struct CardView: View {
    let value: Int
    let removeCard: () -> Void
    @State private var translation: CGSize = .zero
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Card value: \(value)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.white)
            }
            .frame(width: 300, height: 450)
            .background(Color.gray)
            .cornerRadius(12)
            .shadow(radius: 12)
            .offset(x: self.translation.width, y: self.translation.height)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 30), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
//                                print(value.translation)
                        self.translation = value.translation
                    }
                    .onEnded { value in
                        if removeHorizontal(geometry: geometry, gesture: value) || removeVertical(geometry: geometry, gesture: value) {
                            removeCard()
                        }
                        withAnimation(.linear) {
                            self.translation = .zero
                        }
                    }
            )
            // Second frame to center card
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    
    private func removeVertical(geometry: GeometryProxy, gesture: DragGesture.Value) -> Bool {
        let dragDistance = gesture.translation.height / geometry.size.height
        let verticalThreshold = 0.3 // 0.3 denotes 3/10 of the height of the screen dragged
        if dragDistance > verticalThreshold {
            print("Down swipe detected")
            return true
        } else if dragDistance < -verticalThreshold {
            print("Up swipe detected")
            return true
        }
        return false
    }
    
    
    private func removeHorizontal(geometry: GeometryProxy, gesture: DragGesture.Value) -> Bool {
        let dragDistance = gesture.translation.width / geometry.size.width
        let horizontalThreshold = 0.5 // 0.5 denotes 1/2 of the width of the screen dragged
        if dragDistance > horizontalThreshold {
            print("Right swipe detected")
            return true
        } else if dragDistance < -horizontalThreshold {
            print("Left swipe detected")
            return true
        }
        return false
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(value: 0, removeCard: {})
    }
}
