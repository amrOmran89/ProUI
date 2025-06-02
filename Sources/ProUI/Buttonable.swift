//
//  Buttonable.swift
//  ProUI
//
//  Created by Amr Omran on 31.05.25.
//

import SwiftUI

public protocol Buttonable {
    var text: String { get }
    var color: Color { get }
    var textColor: Color { get }
    var maxWidth: CGFloat? { get }
    var font: Font { get }
    var icon: String? { get }
}

public protocol SquareButtonable: Buttonable {
    var cornerRadius: CGFloat { get }
}
