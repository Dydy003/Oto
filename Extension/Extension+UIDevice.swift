//
//  Extension+UIDevice.swift
//  Oto
//
//  Created by Dylan caetano on 18/06/2026.
//

import Foundation
import SwiftUI

extension UIDevice {
    static let isIPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    static let isIPhone: Bool = UIDevice.current.userInterfaceIdiom == .phone
}
