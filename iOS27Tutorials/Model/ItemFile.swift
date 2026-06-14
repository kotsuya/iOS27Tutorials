//
//  ItemFile.swift
//  iOS27Tutorials
//
//  Created by YOO on 2026/06/14.
//

import SwiftUI

struct ItemFile: Identifiable, Hashable, Transferable {
    var id: String { String(describing: color) }
    var color: Color
    
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.color)
    }
}
