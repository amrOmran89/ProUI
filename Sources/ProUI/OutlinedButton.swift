//
//  OutlinedButton.swift
//  ProUI
//
//  Created by Amr Omran on 31.05.25.
//

import SwiftUI

public struct OutlinedButton: View, Buttonable {
    
    public let text: String
    public var textColor: Color
    public let color: Color
    public var font: Font
    public var maxWidth: CGFloat?
    let action: () -> Void

    public init(
        _ text: String,
        textColor: Color = .black,
        font: Font = .body,
        maxWidth: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.textColor = textColor
        self.color = .white
        self.font = font
        self.maxWidth = maxWidth
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .padding()
                .frame(maxWidth: maxWidth)
                .background(color.opacity(0))
                .foregroundStyle(textColor)
                .clipShape(Capsule())
                .overlay {
                    Capsule()
                        .stroke(textColor)
                }
        }

    }
}

#Preview {
    OutlinedButton("Button") { }
}
