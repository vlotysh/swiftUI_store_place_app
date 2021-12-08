//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Vlad Lotysh on 30.11.2021.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
