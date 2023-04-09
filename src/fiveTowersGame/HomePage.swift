//
//  HomePage.swift
//  fiveTowersGame
//
//  Created by Nick Buser on 4/7/23.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Five Towers")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: GameView(viewModel: GameViewModel())) {
                    Text("New Game")
                        .font(.title)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                NavigationLink(destination: GameHistory()) {
                    Text("Game History")
                        .font(.title)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
