//
//  TaskRowView.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import SwiftUI

struct TaskRowView: View {
    
    let task: TaskItem
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isCompleted ? .green : .secondary)
                .font(.system(size: 30.0))
            Text(task.title)
                .strikethrough(task.isCompleted, color: .secondary)
                .foregroundStyle(task.isCompleted ? .secondary : .primary)
            
            Spacer()
            
            PriorityBadge(priority: task.priority)
        }
        .animation(.default, value: task.isCompleted)
    }
}

private struct PriorityBadge: View {
    
    let priority: Priority
    
    var body: some View {
        Text(priority.title)
            .font(.caption.weight(.bold))
            .padding(.horizontal, 12)
            .padding(.vertical, 5)
            .foregroundStyle(priority.color)
            .background(Capsule().fill(priority.color.opacity(0.2)))
    }
}

#Preview {
    List {
        TaskRowView(task: TaskItem(title: "Donner un bain à la chatte", priority: .urgent))
        TaskRowView(task: TaskItem(title: "nettoyage de la maison", priority: .optional, isCompleted: true))
        
    }
}
