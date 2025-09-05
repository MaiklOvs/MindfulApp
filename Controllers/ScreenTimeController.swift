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

    init() {
        setupNotifications()
    }

    deinit {
        deinitNotifications()
    }
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

    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            forName: UIApplication.didBecomeActiveNotification,
            object: nil,
            queue: OperationQueue.main,
            using: { notification in
                if let currentDataModel = self.currentDataModel {
                    currentDataModel.setUnlockCount(currentDataModel.currentUnlockCount + 1)
                    self.objectWillChange.send()
                }
            }
        )
    }

    private func deinitNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
}
