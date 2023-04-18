//
//  ContentView.swift
//  Assignment1
//
//  Created by IBIZA on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    let vehicleEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🛴", "🚲", "🛵", "🏍", "🚆", "🚇", "🚔", "🚍", "✈️", "🚁", "🛰", "⛵️", "🚤"]
    
    let flagEmojis = ["🏳️", "🏴", "🇨🇳", "🇳🇿", "🏁", "🏳️‍🌈", "🚩", "🇺🇳", "🇮🇪", "🇫🇷", "🇰🇷", "🇺🇸", "🇭🇰", "🏴‍☠️"]
    
    let sportEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🪀", "🏏", "🪃", "🪁", "⛸", "🥊", "🛹", "🏓", "🥏", "🏉"]
    
    @State var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🛴", "🚲", "🛵", "🏍", "🚆", "🚇", "🚔", "🚍", "✈️", "🚁", "🛰", "⛵️", "🚤"]
    @State var emojiCount = 24
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack(alignment: .bottom) {
                theme1
                Spacer()
                theme2
                Spacer()
                theme3
            }
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
    
    var theme1 : some View {
        Button {
            emojis = vehicleEmojis.shuffled()
            emojiCount = Int.random(in: 4...vehicleEmojis.count)
        } label: {
            VStack {
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("Vehicles")
                    .font(.footnote)
                    .fontWeight(.medium)
            }
            
        }
    }
    var theme2 : some View {
        Button {
            emojis = flagEmojis.shuffled()
            emojiCount = Int.random(in: 4...flagEmojis.count)
        } label: {
            VStack {
                Image(systemName: "flag")
                    .font(.largeTitle)
                Text("Flags")
                    .font(.footnote)
                    .fontWeight(.medium)
            }
            
        }
    }
    var theme3 : some View {
        Button {
            emojis = sportEmojis.shuffled()
            emojiCount = Int.random(in: 4...sportEmojis.count)
        } label: {
            VStack {
                Image(systemName: "sportscourt")
                    .font(.largeTitle)
                Text("Sports")
                    .font(.footnote)
                    .fontWeight(.medium)
            }
            
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
        
        ContentView()
            .preferredColorScheme(.light)
    }
}
