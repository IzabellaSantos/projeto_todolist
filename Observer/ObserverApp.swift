//
//  ObserverApp.swift
//  Observer
//
//  Created by Izabella Julia dos Santos on 24/05/22.
//

import SwiftUI

@main
struct ObserverApp: App {
    let app = Communication()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: app)
        }
    }
}
