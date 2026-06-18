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
    
}
