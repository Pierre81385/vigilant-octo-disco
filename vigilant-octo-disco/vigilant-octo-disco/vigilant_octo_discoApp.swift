//
//  vigilant_octo_discoApp.swift
//  vigilant-octo-disco
//
//  Created by Peter Bishop on 1/22/24.
//

import SwiftUI
import SwiftData

@main
struct vigilant_octo_discoApp: App {
    var network = Network()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(network)
    }
}
