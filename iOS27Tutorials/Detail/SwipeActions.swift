//
//  SwipeActions.swift
//  iOS27Tutorials
//
//  Created by YOO on 2026/06/14.
//

import SwiftUI

struct SwipeActionsView: View {
    @State private var cards: [Card] = [
        .init(color: .red),
        .init(color: .blue),
        .init(color: .green),
        .init(color: .yellow),
        .init(color: .orange),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(cards) { card in
                    RoundedRectangle(cornerRadius: 16)
                        .fill(card.color.gradient)
                        .frame(height: 60)
                        .swipeActions {
                            Button(role: .destructive) {
                                
                            }
                        }
                }
            }
        }
        .navigationTitle("Swipe Actions")
        .swipeActionsContainer()
        .safeAreaPadding(16)
    }
}

#Preview {
    SwipeActionsView()
}

