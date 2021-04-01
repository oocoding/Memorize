//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zhang Xiangxiong on 2021/4/1.
//

import SwiftUI


  
class EmojiMemoryGame: ObservableObject {
    
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    
    static func createMemoryGame() -> MemoryGame<String> {
        // MemoryGame<String>(numberOfPairsOfCard: 2, cardContentFactory: createCardContent(index: ))
        
        let emojis = ["👻", "🌰", "😁"]
        return MemoryGame<String>(numberOfPairsOfCard: emojis.count) { emojis[$0] }
    }
    
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
