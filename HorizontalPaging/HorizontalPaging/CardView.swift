//
//  CardView.swift
//  HorizontalPaging
//
//  Created by Neal Archival on 8/4/22.
//

import SwiftUI

struct CardView: View {
    let cardNumber: Int
    var body: some View {
        VStack {
            Text("\(cardNumber)")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color.white)
        }
        .frame(width: 250, height: 300)
        .background(Color.gray)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardNumber: 0)
    }
}
