//
//  FAB.swift
//  ProUI
//
//  Created by Amr Omran on 31.05.25.
//

import SwiftUI

struct FABModifier: ViewModifier {
    
    let text: String
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom, alignment: .trailing) {
                Button {
                    action()
                } label: {
                    Text(text)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.black)
                        .clipShape(Circle())
                }
            }
    }
}

struct FABModifierImage: ViewModifier {
    
    let systemImage: String
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: 8) {
                Button {
                    action()
                } label: {
                    Image(systemName: systemImage)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.black)
                        .clipShape(Circle())
                }
                .padding(8)
            }
    }
}
