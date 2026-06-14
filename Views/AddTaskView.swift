//
//  AddTaskView.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var vm = AddTaskViewModel()
    
    let onSave: (TaskItem) -> Void
    
    var body: some View {
        @Bindable var vm = vm
        
        NavigationStack {
            Form {
                Section("Tâche Titre") {
                    TextField("Entrée un nom", text: $vm.title)
                        .submitLabel(.done)
                    if let hint = vm.validationHint {
                        Text(hint)
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
                }
                
                Section("Priorité") {
                    Picker("Priorité", selection: $vm.priority) {
                        ForEach(Priority.allCases) { priority in
                            Text(priority.title).tag(priority)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .gradient()
            .navigationTitle("Vos Tâches")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                toolbar
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button("Annuler") { dismiss() }
        }
        
        ToolbarItem(placement: .confirmationAction) {
            Button("Ajoutez") {
                onSave(vm.makeTask())
                dismiss()
            }
            .disabled(!vm.canSave)
        }
    }
}

#Preview {
    AddTaskView { _ in }
}
