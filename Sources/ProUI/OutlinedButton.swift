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
    public var icon: String?
    let action: () -> Void

    public init(
        _ text: String,
        textColor: Color = .black,
        font: Font = .body,
        icon: String? = nil,
        maxWidth: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.textColor = textColor
        self.color = .white
        self.font = font
        self.maxWidth = maxWidth
        self.action = action
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
    OutlinedButton("Button", icon: "heart") { }
}
