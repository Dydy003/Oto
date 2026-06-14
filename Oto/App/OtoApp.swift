//
//  OtoApp.swift
//  Oto
//
//  Created by Dylan caetano on 14/06/2026.
//

import SwiftUI
import SwiftData

@main
struct OtoApp: App {
    var body: some Scene {
        WindowGroup {
           TaskView()
        }
        .modelContainer(for: TaskItem.self)
    }
}
