//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Zhang Xiangxiong on 2021/3/30.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                    .aspectRatio(2/3, contentMode:.fit)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    
    func body(for size: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(lineWidth: edgeLineWidth)
            
            if card.isFaceUp {
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
            }
        }
        .foregroundColor(.orange)
        .padding(.all, paddingMigrate)
        .font(Font.system(size: min(size.width, size.height)*fontScaleFactor))
    }
    
    // MARK:- Drawing Constants
    let cornerRadius:CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let paddingMigrate: CGFloat = 6
    let fontScaleFactor: CGFloat = 0.6
    
}
