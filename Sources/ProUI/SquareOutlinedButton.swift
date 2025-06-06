//
//  SquareOutlinedButton.swift
//  ProUI
//
//  Created by Amr Omran on 31.05.25.
//

import SwiftUI

public struct SquareOutlinedButton: View, SquareButtonable {
    
    public let text: String
    public let color: Color
    public let textColor: Color
    public var maxWidth: CGFloat?
    public var font: Font
    public var cornerRadius: CGFloat
    public var icon: String?
    let action: () -> Void
    
    public init(
        _ text: String,
        cornerRadius: CGFloat = 10,
        color: Color = .black,
        textColor: Color = .black,
        icon: String? = nil,
        maxWidth: CGFloat? = nil,
        font: Font = .body,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.color = color
        self.maxWidth = maxWidth
        self.cornerRadius = cornerRadius
        self.action = action
        self.textColor = textColor
        self.font = font
        self.icon = icon
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack {
                if let icon {
                    Image(systemName: icon)
                }
                Text(text)
            }
            .padding()
            .frame(maxWidth: maxWidth)
            .background(.white.opacity(0))
            .foregroundStyle(textColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(textColor)
            }
        }
        
    }
}

#Preview {
    SquareOutlinedButton("Button", icon: "camera") { }
}
