//
//  TaskListViewModel.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import Foundation
import SwiftData

@MainActor
@Observable
final class TaskListViewModel {
    
    private(set) var tasks: [TaskItem] = []
    private var repository: TaskRepositoryProtocol?
    
    func configure(with context: ModelContext) {
        guard repository == nil else { return }
        repository = TaskRepository(modelConext: context)
        fetchTasks()
    }
    
    func fetchTasks() {
        guard let repository else { return }
        tasks = repository.fetchTasks()
    }
    
    func add(_ task: TaskItem) {
        guard let repository else { return }
        do {
            try repository.add(task)
            fetchTasks()
        } catch {
            assertionFailure("Échec de l'ajout: \(error)")
        }
    }
    
    func toggleCompletion(for task: TaskItem) {
        guard let repository else { return }
        task.isCompleted.toggle()
        do {
            try repository.save()
        } catch {
            assertionFailure("Échec de la sauvergard: \(error)")
        }
    }
    
    func delete(at offsets: IndexSet) {
        guard let repository else { return }
        do {
            for task in offsets.map({ tasks[$0] }) {
                try repository.delete(task)
            }
            fetchTasks()
        } catch {
            assertionFailure("Échec de la suppression: \(error)")
        }
    }
}
