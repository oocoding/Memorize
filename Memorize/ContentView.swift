//
//  ContentView.swift
//  Memorize
//
//  Created by Zhang Xiangxiong on 2021/3/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0 ..< 5) { item in
                HStack {
                    ForEach(0 ..< 4) { item in
                        CardView(isFaceUp: item%2==0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
    }
}

struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color.white)
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
            
            if isFaceUp {
                Text("🦤")
            } else {
                RoundedRectangle(cornerRadius: 10).fill(Color.orange)
            }
        }
        .foregroundColor(.orange)
        .padding(.all, 6)
    }
}
