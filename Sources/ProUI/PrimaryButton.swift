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
    let action: () -> Void
    
    @State private var isTapped = false

    public init(
        _ text: String,
        color: Color = .black,
        textColor: Color = .white,
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
    }
    
    public var body: some View {
        Text(text)
            .font(font)
            .padding()
            .frame(maxWidth: maxWidth)
            .background(isTapped ? color.opacity(0.5) : color)
            .foregroundStyle(textColor)
            .clipShape(Capsule())
            .onTapGesture {
                isTapped = true
                action()
                isTapped = false
            }

    }
}

#Preview {
    PrimaryButton("Button") { }
}
