//
//  AddTaskViewModel.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import Foundation

@MainActor
@Observable
final class AddTaskViewModel {
    
    var title: String = ""
    var priority: Priority = .normal
    
    private let minimumTitleLength = 3
    
    var trimmedTitle: String {
        title.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var canSave: Bool {
        trimmedTitle.count >= minimumTitleLength
    }
    
    var validationHint: String? {
        guard !canSave, !trimmedTitle.isEmpty else { return nil }
        return "Title must be at least \(minimumTitleLength) characters"
    }
    
    func makeTask() -> TaskItem {
        TaskItem(title: trimmedTitle, priority: priority)
    }
}
