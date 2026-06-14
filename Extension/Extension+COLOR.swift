//
//  Extension+COLOR.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import Foundation
import SwiftUI

extension Color {
    
    static let colorOrange = Color("Oranges")
    static let colorTexts = Color("ColorText")
    static let colorTextSecondarys = Color("ColorTextSecondary")
    static let colorBackground = Color("ColorBackgroundOne")
    static let colorBackgroundSecondary = Color("ColorBackgroundTwo")
    
    static let gradients = LinearGradient(colors: [.colorBackgroundSecondary, .colorBackground], startPoint: .topTrailing, endPoint: .bottomLeading)
    
}
