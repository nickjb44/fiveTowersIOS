//
//  StoneBagView.swift
//  fiveTowersGame
//
//  Created by Nick Buser on 4/7/23.
//
import SwiftUI

struct StoneBagView: View {
    @Binding var stoneBag: StoneBag
    
    var body: some View {
        VStack {
            Text("Stone Bag")
                .font(.headline)
                .padding()

            HStack {
                ForEach(StoneColor.allCases) { color in
                    VStack {
                        StoneView(stone: Stone(color: color))
                        Text("\(stoneBag.stoneCount(of: color))")
                            .font(.caption)
                    }
                    .padding()
                }
            }
        }
        .padding()
    }
}

struct StoneBagView_Previews: PreviewProvider {
    @State static var stoneBag = StoneBag()

    static var previews: some View {
        StoneBagView(stoneBag: $stoneBag)
    }
}
