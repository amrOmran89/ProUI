//
//  OutlinedDropDown.swift
//  ProUI
//
//  Created by Amr Omran on 01.06.25.
//

import SwiftUI

public struct OutlinedDropDown<T>: View where T: Itemable {
    
    let placeHolder: String
    let supportingText: String?
    let icon: String?
    var color: Color
    var cornerRadius: CGFloat
    let items: [T]
    
    @Binding private var selectedItem: T?
    
    public init(
        _ items: [T],
        selectedItem: Binding<T?>,
        placeHolder: String,
        supportingText: String? = nil,
        icon: String? = nil,
        color: Color = .black,
        cornerRadius: CGFloat = 8
    ) {
        self.placeHolder = placeHolder
        self.supportingText = supportingText
        self.icon = icon
        self.color = color
        self.cornerRadius = cornerRadius
        self.items = items
        self._selectedItem = selectedItem
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let icon {
                    Image(systemName: icon)
                        .foregroundStyle(color)
                }
                
                ZStack {
                    Text(selectedItem?.label ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(placeHolder)
                        .font(selectedItem?.label == nil ? .body : .caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y: selectedItem?.label == nil ? 0 : -18)
                }
                
                Menu {
                    ForEach(items) { item in
                        Button {
                            selectedItem = item
                        } label: {
                            Text(item.label)
                        }

                    }
                } label: {
                    Image(systemName: "chevron.down")
                        .foregroundStyle(color)
                }
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color)
            }
            if let supportingText {
                Text(supportingText)
                    .foregroundStyle(color)
                    .font(.caption)
                    .padding(.leading)
            }
        }
        .frame(maxWidth: .infinity)
    }
}


public protocol Itemable: Identifiable {
    var label: String { get }
}
