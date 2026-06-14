//
//  TaskView.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import SwiftUI
import SwiftData

struct TaskView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var vm = TaskListViewModel()
    @State private var isAddingTask = false
    
    var body: some View {
        NavigationStack {
            Group {
                if vm.tasks.isEmpty {
                    ContentUnavailableView {
                        Image("Oto")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } description: {
                        Text("Appuyez sur + pour ajouter votre première tâche.")
                    }
                } else {
                    List {
                        ForEach(vm.tasks) { task in
                            NavigationLink {
                                TaskDetailView(task: task, vm: vm)
                            } label: {
                                TaskRowView(task: task)
                            }
                        }
                        .onDelete(perform: vm.delete)
                    }
                }
            }
            .gradient()
            .navigationTitle("Oto")
            .toolbar { toolbar }
            .sheet(isPresented: $isAddingTask) {
                AddTaskView { newTask in
                    vm.add(newTask)
                }
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                isAddingTask = true
            } label: {
                Label("Ajoute une tâche", systemImage: "plus")
            }
        }
    }
}

#Preview {
    TaskView()
}
