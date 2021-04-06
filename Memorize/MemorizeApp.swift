//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Zhang Xiangxiong on 2021/3/30.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        return WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

