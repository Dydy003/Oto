//
//  Extension+UI.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import Foundation
import SwiftUI

extension Priority {
    
    var color: Color {
        switch self {
        case .urgent: .red
        case .normal : .blue
        case .optional: .green
        }
    }
}
