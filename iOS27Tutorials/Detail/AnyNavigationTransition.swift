//
//  AnyNavigationTransition.swift
//  iOS27Tutorials
//
//  Created by YOO on 2026/06/14.
//

import SwiftUI

struct AnyNavigationTransitionView: View {
    @State private var showSheet: Bool = false
    @Namespace private var namespace
    var body: some View {
        Button("Show Sheet") {
            showSheet.toggle()
        }
        .matchedTransitionSource(id: "SOURCE", in: namespace)
        .sheet(isPresented: $showSheet) {
//            Text("Hello From Sheet")
//                .onTapGesture {
//                    showSheet = false
//                }
//                .navigationTransition(.crossFade)
            
            DetailView(namespace: namespace)
        }
    }
}

struct DetailView: View {
    var namespace: Namespace.ID
    @State private var isZoom: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Toggle("Is Zoom", isOn: $isZoom)
            
            Button(role: .destructive) {
                dismiss()
            }
        }
        .padding(16)
        .navigationTransition(isZoom ? AnyNavigationTransition(.zoom(sourceID: "SOURCE", in: namespace)) : AnyNavigationTransition(.crossFade))
        
    }
}
