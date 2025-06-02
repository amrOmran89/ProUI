//
//  SwiftUIView.swift
//  ProUI
//
//  Created by Amr Omran on 31.05.25.
//

import SwiftUI

public struct PrimaryButton: View, Buttonable {
    
    public let text: String
    public let color: Color
    public let textColor: Color
    public var maxWidth: CGFloat?
    public let font: Font
    public let icon: String?
    let action: () -> Void
    
    @State private var isTapped = false

    public init(
        _ text: String,
        color: Color = .purple,
        textColor: Color = .white,
        icon: String? = nil,
        maxWidth: CGFloat? = nil,
        font: Font = .body,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.color = color
        self.maxWidth = maxWidth
        self.action = action
        self.font = font
        self.textColor = textColor
        self.icon = icon
    }
    
    public var body: some View {
        Button {
            
        } label: {
            HStack {
                if let icon {
                    Image(systemName: icon)
                }
                Text(text)
            }
            .font(font)
            .padding()
            .frame(maxWidth: maxWidth)
            .background(isTapped ? color.opacity(0.5) : color)
            .foregroundStyle(textColor)
            .clipShape(Capsule())
        }
    }
}

#Preview {
    PrimaryButton("Button") { }
}
