//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zhang Xiangxiong on 2021/4/1.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        
        guard let chosenIndex = self.cards.firstIndex(where: {$0.id == card.id}) else {
            return
        }
        print("Card chosen index: \(chosenIndex)")
        self.cards[chosenIndex].isFaceUp.toggle()
    }
    
    
    init(numberOfPairsOfCard: Int, cardContentFactory:(Int) -> CardContent) {
        self.cards = []
        for pairIndex in  0 ..< numberOfPairsOfCard {
            let content = cardContentFactory(pairIndex)
            self.cards.append(Card(content: content))
            self.cards.append(Card(content: content))
        }
        
        self.cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id = UUID()
        
        var isFaceUp: Bool =  false
        var isMatched: Bool = false
        var content: CardContent
    }
}
