//
//  ObserverApp.swift
//  Observer
//
//  Created by Izabella Julia dos Santos on 24/05/22.
//

import SwiftUI

@main
struct ObserverApp: App {
    let app = TasksViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(taskManager: app)
        }
    }
}
