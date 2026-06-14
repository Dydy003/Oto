//
//  Item.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import Foundation
import SwiftData

@Model
final class TaskItem {
    
    private(set) var id: UUID
    var title: String
    var priority: Priority
    var isCompleted: Bool
    var createdAt: Date
    
    init(
        id: UUID = UUID(),
        title: String,
        priority: Priority,
        isCompleted: Bool = false,
        createdAt: Date = .now
    ) {
        self.id = id
        self.title = title
        self.priority = priority
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }
}
