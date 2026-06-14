//
//  PriorityModel.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import Foundation

enum Priority: String, Codable, CaseIterable, Identifiable {
    
    case urgent
    case normal
    case optional
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .urgent: return "Urgent"
        case .normal: return "Normal"
        case .optional: return "Optional"
        }
    }
    
    var sortRank: Int {
        switch self {
        case .urgent: 2
        case .normal: 1
        case .optional: 0
        }
    }
}
