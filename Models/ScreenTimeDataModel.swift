//
//  ScreenTimeData.swift
//  MindfulApp
//
//  Created by Ovsyannikov.M10 on 04.09.2025.
//

import DataDetection

final class ScreenTimeDataModel {
    let date = Date()

    private(set) var screenTime: TimeInterval = 0
    private(set) var unlockCount = 0

    private var timeForApps: [String: TimeInterval] = [:]

    var currentScreenTime: TimeInterval { screenTime }
    var currentUnlockCount: Int { unlockCount }
    var appUsage: [String: TimeInterval] { timeForApps }

    init(
        screenTime: TimeInterval,
        unlockCount: Int = 0,
        timeForApps: [String : TimeInterval]
    ) {
        self.screenTime = screenTime
        self.unlockCount = unlockCount
        self.timeForApps = timeForApps
    }
}

extension ScreenTimeDataModel {
    func setUnlockCount(_ unlockCount: Int) {
        guard unlockCount >= 0 else { return }
        self.unlockCount = unlockCount
    }

    func updateScreenTime(_ screenTime: TimeInterval) {
        self.screenTime += screenTime
    }

    func addScreenTime(_ app: String, _ time: TimeInterval) {
        guard !app.isEmpty, time >= 0 else { return }
        timeForApps[app, default: 0] += time
    }
}
