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

            }
        }
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
        print("draw cardView:\(card)")
        return ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color.white)
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
            
            if card.isFaceUp {
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill(Color.orange)
            }
        }
        .foregroundColor(.orange)
        .padding(.all, 6)
    }
}
