// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public extension View {
    
    func floatingActionButton(_ text: String, action: @escaping () -> Void) -> some View {
        self.modifier(FABModifier(text: text, action: action))
    }
    
    func floatingActionButtonWithImage(_ systemImage: String, action: @escaping () -> Void) -> some View {
        self.modifier(FABModifierImage(systemImage: systemImage, action: action))
    }
    
    func isVisible(_ value: Bool) -> some View {
        modifier(IsVisible(isVisible: value))
    }
}

struct IsVisible: ViewModifier {
    
    let isVisible: Bool
    
    func body(content: Content) -> some View {
        if isVisible {
            content
        } else {
            EmptyView()
        }
    }
}
