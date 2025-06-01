//
//  OutlinedTextField.swift
//  ProUI
//
//  Created by Amr Omran on 01.06.25.
//

import SwiftUI

public struct OutlinedTextField: View {
    
    @Binding var text: String
    let placeHolder: String
    let supportingText: String?
    let icon: String?
    var showClearButton: Bool
    var isValid: Bool
    var color: Color
    var cornerRadius: CGFloat
    
    public init(
        _ text: Binding<String>,
        placeHolder: String,
        supportingText: String?,
        color: Color = .black,
        cornerRadius: CGFloat = 8,
        icon: String? = nil,
        showClearButton: Bool = false,
        isValid: Bool = true
    ) {
        self._text = text
        self.placeHolder = placeHolder
        self.supportingText = supportingText
        self.icon = icon
        self.showClearButton = showClearButton
        self.isValid = isValid
        self.color = color
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let icon {
                    Image(systemName: icon)
                        .foregroundStyle(color)
                }
                
                ZStack {
                    TextField(placeHolder, text: $text)
                    Text(placeHolder)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .isVisible(!text.isEmpty)
                        .offset(y: -18)
                }
                
                if showClearButton && !text.isEmpty {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "xmark.circle")
                            .foregroundStyle(color)
                    }

                }
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(isValid ? color : Color.red)
            }
            if let supportingText {
                Text(supportingText)
                    .foregroundStyle(isValid ? color : Color.red)
                    .font(.caption)
                    .padding(.leading)
            }
        }
        
    }
}

#Preview {
    @State var text = ""
    OutlinedTextField(
        $text,
        placeHolder: "Outlined",
        supportingText: "Supporting Text",
        icon: "magnifyingglass",
        showClearButton: true, isValid: true
    )
}
