//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zhang Xiangxiong on 2021/4/1.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCard: Int, cardContentFactory:(Int) -> CardContent) {
        self.cards = []
        for pairIndex in  0 ..< numberOfPairsOfCard {
            let content = cardContentFactory(pairIndex)
            self.cards.append(Card(content: content))
            self.cards.append(Card(content: content))
        }
    }
    
    struct Card: Identifiable {
        var id = UUID()
        
        var isFaceUp: Bool =  false
        var isMatched: Bool = false
        var content: CardContent
    }
}
