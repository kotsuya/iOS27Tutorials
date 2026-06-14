//
//  Reorderable.swift
//  iOS27Tutorials
//
//  Created by YOO on 2026/06/14.
//

import SwiftUI

struct ReorderableView: View {
    @State private var cards: [Card] = [
        .init(color: .red),
        .init(color: .blue),
        .init(color: .green),
        .init(color: .yellow),
        .init(color: .orange),
    ]
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
            ForEach(cards) { card in
                RoundedRectangle(cornerRadius: 15)
                    .fill(card.color.gradient)
                    .aspectRatio(1, contentMode: .fit)
                
            }
            .reorderable()
        }
        .reorderContainer(for: Card.self, move: { difference in
            guard let source = difference.sources.first else { return }
            guard let sourceIndex = cards.index(cardID: source) else { return }
            
            let destination = difference.destination
            let removedCard = cards.remove(at: sourceIndex)
            
            switch destination.position {
            case .before(let beforeID):
                //
                guard let destinationIndex = cards.index(cardID: beforeID) else { return }
                cards.insert(removedCard, at: destinationIndex)
            case .end:
                //
                cards.insert(removedCard, at: cards.endIndex)
            }
        })
        .padding()
    }
}
