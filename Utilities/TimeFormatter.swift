//
//  TimeFormatter.swift
//  MindfulApp
//
//  Created by Ovsyannikov.M10 on 04.09.2025.
//
import SwiftUI

/// Форматирует вывод времени в формате часы::минуты::cекунды
enum TimeFormatter {
    static func format(_ time: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.calendar?.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: time) ?? "\(Int(time)) с"
    }
}
