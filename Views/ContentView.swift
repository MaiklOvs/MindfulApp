//
//  ContentView.swift
//  MindfulApp
//
//  Created by Ovsyannikov.M10 on 04.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var controller = ScreenTimeController()
    var body: some View {
        VStack {
            if controller.isLoading {
                ProgressView()
            } else if let data = controller.currentDataModel {
                Text("Время: \(TimeFormatter.format(data.screenTime))")
                Text("Разблокировок: \(data.unlockCount)")
            } else {
                Button("Загрузить") { controller.loadMockData() }
            }
        }
    }
}

#Preview {
    ContentView()
}
