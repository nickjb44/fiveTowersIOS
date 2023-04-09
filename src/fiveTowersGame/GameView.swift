//
//  GameView.swift
//  fiveTowersGame
//
//  Created by Nick Buser on 4/7/23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        VStack {
            Text("Five Towers")
                .font(.largeTitle)
                .padding()

            BoardView(board: $viewModel.board, onPositionTapped: playStone)
            
            StoneBagView(stoneBag: $viewModel.board.stoneBag)
            

            HStack {
                ForEach(viewModel.playerStones[viewModel.currentPlayer - 1]) { stone in
                    StoneView(stone: stone)
                }
            }
            .padding()

            Button(action: viewModel.startGame, label: {
                Text("Start Game")
            })
            .padding()

            Text("Player \(viewModel.currentPlayer)'s turn")
                .font(.headline)
                .padding()
        }
    }

    private func playStone(at position: (Int, Int)) {
        viewModel.playStone(at: position)
    }
}

struct StoneView: View {
    let stone: Stone

    var body: some View {
        Circle()
            .fill(stoneColor(stone.color))
            .frame(width: 30, height: 30)
    }

    private func stoneColor(_ color: StoneColor) -> Color {
        switch color {
        case .green:
            return Color.green
        case .red:
            return Color.red
        case .blue:
            return Color.blue
        case .white:
            return Color.white
        case .yellow:
            return Color.yellow
        case .purple:
            return Color.purple
        }
    }
}

struct BoardView: View {
    @Binding var board: Board
    let onPositionTapped: ((Int, Int)) -> Void

    // Implement the board view here, including the arrangement of circles and lines.
    // Add tap gesture recognizers for each position on the board, and call onPositionTapped
    // with the corresponding row and column of the tapped position.
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())
    }
}
