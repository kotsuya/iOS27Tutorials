//
//  Router.swift
//  iOS27Tutorials
//
//  Created by YOO on 2026/06/14.
//

import SwiftUI
import UIKit
import Combine

enum AppScreen {
    case home
    case detail(item: DetailScreen)
    
    enum DetailScreen {
        case swipeActions
        case reorderable
        case sectionedReorderable
        case multiDragDropContainer
        case anyNavigationTransition
    }
}

final class Router: ObservableObject {
    static let shared = Router()
    private var navigationController: UINavigationController?
    
    private init() { }
    
    func configure(with nav: UINavigationController) {
        self.navigationController = nav
    }
    
    func navigate(to screen: AppScreen) {
        let view = makeView(screen)
        let hostingController = UIHostingController(rootView: view)
        navigationController?.pushViewController(hostingController, animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @ViewBuilder
    private func makeView(_ screen: AppScreen) -> some View {
        switch screen {
        case .home:
            ContentView()
        case .detail(let item):
            switch item {
            case .swipeActions:
                SwipeActionsView()
            case .reorderable:
                ReorderableView()
            case .sectionedReorderable:
                SectionedReorderableView()
            case .multiDragDropContainer:
                MultiDragDropContainerView()
            case .anyNavigationTransition:
                AnyNavigationTransitionView()
            }
        }
    }
}

struct NavigationContainerView<Root: View>: UIViewControllerRepresentable {
    let rootView: Root
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let rootVC = UIHostingController(rootView: rootView)
        let nav = UINavigationController(rootViewController: rootVC)
        Router.shared.configure(with: nav)
        return nav
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
