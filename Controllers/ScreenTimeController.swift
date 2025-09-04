//
//  ScreenTimeController.swift
//  MindfulApp
//
//  Created by Ovsyannikov.M10 on 04.09.2025.
//

import SwiftUI

final class ScreenTimeController: ObservableObject {
    @Published var currentDataModel: ScreenTimeDataModel?
    @Published var isLoading = false
}

extension ScreenTimeController {
    func loadMockData() {
        isLoading = true
        currentDataModel = ScreenTimeDataModel(
            screenTime: 14425,
            unlockCount: 42,
            timeForApps: [
                "Instagram": 3600,
                "YouTube": 7200,
                "Messages": 3600
            ]
        )
        isLoading = false
    }
}
