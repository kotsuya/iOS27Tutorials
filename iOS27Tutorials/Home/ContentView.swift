//
//  ContentView.swift
//  iOS27Tutorials
//
//  Created by YOO on 2026/06/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Button {
                Router.shared.navigate(to: .detail(item: .swipeActions))
            } label: {
                Text("Swipe Actions")
            }
            
            Button {
                Router.shared.navigate(to: .detail(item: .reorderable))
            } label: {
                Text("Reorderable")
            }
            
            Button {
                Router.shared.navigate(to: .detail(item: .sectionedReorderable))
            } label: {
                Text("Sectioned Reorderable")
            }
            
            Button {
                Router.shared.navigate(to: .detail(item: .multiDragDropContainer))
            } label: {
                Text("Multi-Drag & Drop Container")
            }
            
            Button {
                Router.shared.navigate(to: .detail(item: .anyNavigationTransition))
            } label: {
                Text("AnyNavigationTransition & CrossFade")
            }
        }
    }
}

#Preview {
    ContentView()
}
