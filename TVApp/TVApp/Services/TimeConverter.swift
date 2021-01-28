//
//  TimeConverter.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/26.
//

import Foundation

class TimeConverter {
    // MARK: Internal

    typealias DateType = (Int, Int, Int)

    static let shared = TimeConverter()

    func convertDuration(duration: Int) -> String {
        let second = duration % 60

        let minute = (duration) / 60
        let hour = (duration) / (60 * 60)

        return hour == 0 ? String(format: "%02d:%02d", minute, second) : String(format: "%d:%02d:%02d", hour, minute, second)
    }

    func maxRangeInSubtractDate(dateStr: String) -> String {
        guard let diff = dateCompareToNow(dateStr: dateStr) else { return "" }

        var diffString = ""
        if let year = diff.year, let month = diff.month, let day = diff.day, let hour = diff.hour, let minute = diff.minute, let second = diff.second {
            if year > 0 {
                diffString = "\(year)년전"
            } else if month > 0 {
                diffString = "\(month)개월전"
            } else if day > 0 {
                diffString = "\(day)일전"

            } else if hour > 0 {
                diffString = "\(hour)시간전"

            } else if minute > 0 {
                diffString = "\(minute)분전"

            } else {
                diffString = "\(second)일전"
            }
        }
        return diffString
    }

    // MARK: Private

    private func dateCompareToNow(dateStr: String) -> DateComponents? {
        var calendar = Calendar.current
        if let timeZone = TimeZone(identifier: "UTC") {
            calendar.timeZone = timeZone
        }

        guard let date = stringToDate(dateStr: dateStr) else { return nil }
        let now = Date()

        return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date, to: now)
    }

    private func stringToDate(dateStr: String) -> Date? {
        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "UTC")

        guard let date: Date = formatter.date(from: dateStr) else { return nil }

        return date
    }
}

extension Date {
    static func -(lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate-rhs.timeIntervalSinceReferenceDate
    }
}
