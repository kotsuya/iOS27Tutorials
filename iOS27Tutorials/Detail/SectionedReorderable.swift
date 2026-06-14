//
//  SectionedReorderable.swift
//  iOS27Tutorials
//
//  Created by YOO on 2026/06/14.
//

import SwiftUI

struct SectionedReorderableView: View {
    @State private var groups: [CardGroup] = [
        .init(id: "Active", cards: [
            .init(color: .red),
            .init(color: .blue),
            .init(color: .green),
            .init(color: .yellow),
            .init(color: .orange),
        ]),
        .init(id: "Completed", cards: [
            .init(color: .cyan),
            .init(color: .indigo),
            .init(color: .gray),
        ]),
    ]
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 10) {
            ForEach(groups) { group in
                Text(group.id)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                    ForEach(group.cards) { card in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(card.color.gradient)
                            .aspectRatio(1, contentMode: .fit)
                        
                    }
                    .reorderable(collectionID: group.id)
                }
            }
        }
        .reorderContainer(for: Card.self, in: CardGroup.ID.self, move: { difference in
            guard let source = difference.sources.first else { return }
            guard let sourceGroupIndex = groups.index(cardID: source) else { return }
            guard let sourceIndex = groups[sourceGroupIndex].cards.index(cardID: source) else { return }
            
            let destination = difference.destination
            let removedCard = groups[sourceGroupIndex].cards.remove(at: sourceIndex)
            let destinationGroup = destination.collectionID
            guard let destinationGroupIndex = groups.index(cardID: destinationGroup) else { return }
            
            switch destination.position {
            case .before(let beforeID):
                //
                guard let destinationIndex = groups[destinationGroupIndex].cards.index(cardID: beforeID) else { return }
                groups[destinationGroupIndex].cards.insert(removedCard, at: destinationIndex)
            case .end:
                //
                groups[destinationGroupIndex].cards.append(removedCard)
            }
        })
        .padding()
    }
}
