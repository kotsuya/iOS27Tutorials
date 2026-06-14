//
//  MultiDragDropContainer.swift
//  iOS27Tutorials
//
//  Created by YOO on 2026/06/14.
//

import SwiftUI

struct MultiDragDropContainerView: View {
    @State private var files: [ItemFile] = [
        .init(color: .red),
        .init(color: .blue),
        .init(color: .green),
        .init(color: .yellow),
        .init(color: .orange),
    ]
    @State private var selectedFiles: Set<ItemFile> = .init()
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
            ForEach(files) { file in
                RoundedRectangle(cornerRadius: 15)
                    .fill(file.color.gradient)
                    .aspectRatio(1, contentMode: .fit)
                    .overlay {
                        if selectedFiles.contains(file) {
                            Image(systemName: "checkmark.circle.fill")
                        }
                    }
                    .onTapGesture {
                        if selectedFiles.contains(file) {
                            selectedFiles.remove(file)
                        } else {
                            selectedFiles.insert(file)
                        }
                    }
                    .draggable(containerItemID: file.id)
                
            }
        }
        .dragContainer(for: ItemFile.self, { draggedItemIDs in
            if selectedFiles.contains(where: { draggedItemIDs.contains($0.id) }) {
                return selectedFiles
            }
            
            return []
        })
        .onDragSessionUpdated({ session in
            print(session.phase)
        })
        .padding()
    }
}
