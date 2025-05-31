//
//  SquarePrimaryButton.swift
//  ProUI
//
//  Created by Amr Omran on 31.05.25.
//

import SwiftUI

public struct SquarePrimaryButton: View {
    
    let text: String
    let color: Color
    var maxWidth: CGFloat?
    var cornerRadius: CGFloat
    let action: () -> Void
    
    public init(
        _ text: String,
        cornerRadius: CGFloat = 10,
        color: Color = .black,
        maxWidth: CGFloat? = nil,
        action: @escaping () -> Void
        
    ) {
        self.text = text
        self.color = color
        self.maxWidth = maxWidth
        self.cornerRadius = cornerRadius
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .padding()
                .frame(maxWidth: maxWidth)
                .background(color)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }

    }
}

#Preview {
    SquarePrimaryButton("Button", cornerRadius: 10) { }
}
