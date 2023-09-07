//
//  ContentView.swift
//  ColorApp
//
//  Created by Ahmed Elesawy on 06/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var game = Game()
    @State var guess: RGB
    @State var showScore = false
    
    let circleSize: CGFloat = 0.275
    let labelHeight: CGFloat = 0.06
    let labelWidth: CGFloat = 0.53
    let buttonWidth: CGFloat = 0.87
    
    var body: some View {
        VStack {
            
            ColorCircle(color: game.target)
            
            if !showScore {
                ZStack {
                    Color.element
                    BevelText(text: "R: ??? G: ??? B: ???", width: 200, height: 48)
                }
                .frame(width: 300, height: 100)
                .previewLayout(.sizeThatFits)
                
                
            } else {
                BevelText(text: game.target.intString(),width: 200, height: 48)
            }
            
            ColorCircle(color: guess)
            
            BevelText(text: "R: 204, G: 76, B: 178", width: 200, height: 48)
                .padding()
            ColorSlider(color: .red, value: $guess.red)
            ColorSlider(color: .green, value: $guess.green)
            ColorSlider(color: .blue, value: $guess.blue)
            Button("show the solution") {
                showScore.toggle()
                game.check(guess: guess)
            }
            .buttonStyle(NeuButtonStyle(width: 330, height: 44))

        }
        .font(.headline)
        .padding(.bottom)
        .alert(isPresented: $showScore) {
            Alert(title: Text("Score"), message: Text(String(game.scoreRound)), dismissButton: .default(Text("OK")) {
                game.startNewRound()
                guess = RGB()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess: RGB(red: 0.3, green: 0.3, blue: 0.7))
            .preferredColorScheme(.light)
            .previewDevice("iPhone 8")
    }
}


