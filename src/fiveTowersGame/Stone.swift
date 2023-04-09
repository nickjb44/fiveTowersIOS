//
//  Stone.swift
//  fiveTowersGame
//
//  Created by Nick Buser on 4/7/23.
//

import Foundation

enum StoneType: CaseIterable {
    case common, rare
}

enum StoneColor {
    case green, red, blue, white, yellow, purple
}

struct Stone: Identifiable {
    let id = UUID()
    let color: StoneColor
    let type: StoneType
}
