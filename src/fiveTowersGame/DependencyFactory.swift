//
//  DependencyFactory.swift
//  fiveTowersGame
//
//  Created by Nick Buser on 4/7/23.
//

protocol DependencyFactory {
    func createGameViewModel() -> GameViewModel
}

class DefaultDependencyFactory: DependencyFactory {
    func createGameViewModel() -> GameViewModel {
        return GameViewModel()
    }
}
