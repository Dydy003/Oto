//
//  Extension+VIEW.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import Foundation
import SwiftUI

extension View {
    func gradient() -> some View {
        ZStack {
            Color.gradients.ignoresSafeArea()
            self
        }
    }
}

extension View {
    
    @ViewBuilder func`if`<Content: View>(_ condition:Bool,transform: (Self)->Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
