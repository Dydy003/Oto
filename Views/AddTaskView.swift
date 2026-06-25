//
//  AddTaskView.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
    
    @Environment(\.dismiss) private var dismiss
    //    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    @State private var vm = AddTaskViewModel()
    
    let onSave: (TaskItem) -> Void
    
    var body: some View {
        @Bindable var vm = vm
        
        NavigationStack {
            Form {
                Section {
                    VStack(spacing: 22) {
                        Text("Task Titre")
                            .if(UIDevice.isIPad, transform: { view in
                                view.font(.system(size: 35, weight: .semibold))
                            })
                            .if(UIDevice.isIPhone, transform: { view in
                                view.font(.system(size: 25, weight: .semibold))
                            })
                            .padding(.top, 30)
                        TextField("Nom de la tâche", text: $vm.title)
                            .textFieldStyle(.roundedBorder)
                            .submitLabel(.done)
                        if let hint = vm.validationHint {
                            Text(hint)
                                .font(.caption)
                                .foregroundStyle(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Picker("Priorité", selection: $vm.priority) {
                            ForEach(Priority.allCases) { priority in
                                Text(priority.title).tag(priority)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding(.vertical, UIDevice.isIPad ? 400 : 30)
//                    .if(UIDevice.isIPad) { view in
//                        view.padding(.vertical, 400)
//                    }
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .background(Color.gradients)
            .toolbar {
                toolbar
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button("Annuler") { dismiss() }
                .buttonStyle((.borderedProminent))
                .tint(Color.oranges)
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
