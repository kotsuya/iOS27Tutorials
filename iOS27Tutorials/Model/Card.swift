//
//  Card.swift
//  iOS27Tutorials
//
//  Created by YOO on 2026/06/14.
//

import SwiftUI

struct Card: Identifiable {
    var color: Color
    
    var id: String {
        String(describing: color)
    }
}

extension [Card] {
    func index(cardID: String) -> Int? {
        firstIndex(where: { $0.id == cardID })
    }
}

struct CardGroup: Identifiable {
    var id: String
    var cards: [Card]
}

extension [CardGroup] {
    func index(cardID: String) -> Int? {
        firstIndex(where: { $0.cards.contains(where: { $0.id == cardID }) })
    }
    
    func index(groupID: String) -> Int? {
        firstIndex(where: { $0.id == groupID })
    }
}
