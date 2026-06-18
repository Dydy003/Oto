//
//  TaskDetailView.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let task: TaskItem
    let vm: TaskListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(task.title)
                    .font(.largeTitle.weight(.bold))
                
                Spacer()
            }
            Label(task.priority.title, systemImage: "flag.fill")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(task.priority.color)
            Button {
                vm.toggleCompletion(for: task)
                dismiss()
            } label: {
                Text(task.isCompleted ? "Mark not Done" : "Mark Done")
                    .font(.headline)
                    .frame(maxWidth: .infinity, minHeight: 44)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.oranges)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Détail")
        .navigationBarTitleDisplayMode(.inline)
        .gradient()
    }
}

#Preview {
    TaskDetailView(
        task: TaskItem(title: "Test", priority: .urgent),
        vm: TaskListViewModel()
    )
}
