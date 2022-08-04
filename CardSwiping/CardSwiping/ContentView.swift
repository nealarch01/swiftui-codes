//
//  ContentView.swift
//  CardSwiping
//
//  Created by Neal Archival on 8/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var translation: CGSize = .zero
    @State private var cardNumbers: Array<Int> = [1, 2, 3, 4, 5]
    
    var body: some View {
        ZStack {
            ForEach(Array(cardNumbers.enumerated()), id: \.offset) { index, card_num in
                CardView(value: card_num, removeCard: pop)
            }
        }
    }
    
    func pop() { // Removes the top card from the cardNums array
        self.cardNumbers.removeLast(1) // Removes the top most element O(k)
        // Use removeLast because removeFirst is O(n)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
