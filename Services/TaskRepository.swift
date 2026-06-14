//
//  TaskRepository.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import Foundation
import SwiftData

@MainActor
protocol TaskRepositoryProtocol {
    func fetchTasks() -> [TaskItem]
    func add(_ task: TaskItem) throws
    func delete(_ task: TaskItem) throws
    func save() throws
}

@MainActor
final class TaskRepository: TaskRepositoryProtocol {
    private let modelConext: ModelContext
    
    init(modelConext: ModelContext) {
        self.modelConext = modelConext
    }
    
    func fetchTasks() -> [TaskItem] {
        let descrptor = FetchDescriptor<TaskItem>(
            sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
        )
        return (try? modelConext.fetch(descrptor)) ?? []
    }
    
    func add(_ task: TaskItem) throws {
        modelConext.insert(task)
        try modelConext.save()
    }
    
    func delete(_ task: TaskItem) throws {
        modelConext.delete(task)
        try modelConext.save()
    }
    
    func save() throws {
        try modelConext.save()
    }
}
