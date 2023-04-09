//
//  GameViewModel.swift
//  fiveTowersGame
//
//  Created by Nick Buser on 4/7/23.
//
import SwiftUI

class GameViewModel: ObservableObject {
    @Published private(set) var board: Board
    @Published private(set) var currentPlayer: Int
    @Published private(set) var gameState: GameState

    enum GameState {
        case notStarted, inProgress, gameOver
    }

    private var playerStones: [[Stone]]

    init() {
        board = Board()
        currentPlayer = 1
        gameState = .notStarted
        playerStones = [[], []]
    }

    func startGame() {
        // Draw 3 stones for each player
        playerStones[0] = board.drawStones(count: 3)
        playerStones[1] = board.drawStones(count: 3)

        gameState = .inProgress
    }

    func playStone(at position: (Int, Int)) {
        guard gameState == .inProgress else { return }
        let playerIndex = currentPlayer - 1

        // Check if the move is valid
        guard let stoneIndex = validMove(at: position, for: currentPlayer) else { return }

        // Place the stone on the board
        let stone = playerStones[playerIndex][stoneIndex]
        board.placeStone(stone, at: position)

        // Remove the played stone from the player's hand
        playerStones[playerIndex].remove(at: stoneIndex)

        // Check for stone destruction
        handleStoneDestruction(at: position)

        // Apply the effect of the played stone
        applyStoneEffect(stone: stone, position: position)

        // Check if the game is over
        if isGameOver() {
            gameState = .gameOver
        }
    }

    private func applyStoneEffect(stone: Stone, position: (Int, Int)) {
        let playerIndex = currentPlayer - 1
        switch stone.color {
        case .green:
            // The player can play another stone of any color (handled in playStone method)
        case .red:
            // The player may destroy any number of adjacent stones
            handleRedStoneEffect(at: position)
        case .blue:
            // The player may pull three stones at random from the pool and choose one
            handleBlueStoneEffect()
        case .white:
            // Exchange hands with the opponent
            exchangeHands()
        case .yellow:
            // The player may destroy any stone on the board and draw a stone for each destroyed
            handleYellowStoneEffect()
        case .purple:
            // The player may reveal any number of stones from their hand and exchange them for an equal number of stones on the board
            handlePurpleStoneEffect()
        }

        // If a green stone is played, the current player can play another stone
        if stone.color != .green {
            // Switch to the other player
            currentPlayer = 3 - currentPlayer
        }
    }

    private func handleRedStoneEffect(at position: (Int, Int)) {
        // Implement the logic for destroying any number of adjacent stones.
    }

    private func handleBlueStoneEffect() {
        // Implement the logic for pulling three stones at random from the pool,
        // revealing them to all players, choosing one, and returning the other two to the pool.
    }

    private func exchangeHands() {
        playerStones.swapAt(0, 1)
    }
    
    private func handleYellowStoneEffect() {
        // Implement the logic for destroying any stone on the board and
        // drawing a stone for each stone destroyed due to this action.
    }

    private func handlePurpleStoneEffect() {
        // Implement the logic for revealing any number of stones from the player's
        // hand and exchanging them for an equal number of stones already on the board.
    }

    private func validMove(at position: (Int, Int), for player: Int) -> Int? {
        // Implement your validation logic here, and return the index of the stone
        // in the player's hand that is allowed to be played at the given position.
        // Return nil if the move is invalid.
    }

    private func handleStoneDestruction(at position: (Int, Int)) {
        // Implement the stone destruction logic here.
    }

    func isGameOver() -> Bool {
        // Implement your game over condition check here.
    }
}
