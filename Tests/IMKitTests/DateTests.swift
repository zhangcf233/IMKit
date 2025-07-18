//
//  DateTests.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import XCTest
@testable import IMKit

final class DateFormatTests: XCTestCase {

    func testToday() {
        let now = Date()
        let result = now.formattedDisplayTime()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        XCTAssertEqual(result, formatter.string(from: now))
    }

    func testYesterday() {
        let calendar = Calendar.current
        let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())!
        let date = calendar.date(bySettingHour: 12, minute: 0, second: 0, of: yesterday)!
        let result = date.formattedDisplayTime()
        XCTAssertEqual(result, "昨天 12:00")
    }

    func testThisYear() {
        let calendar = Calendar.current
        let date = calendar.date(from: DateComponents(year: calendar.component(.year, from: Date()), month: 1, day: 1, hour: 9, minute: 0))!
        let result = date.formattedDisplayTime()
        XCTAssertEqual(result, "1月1日")
    }

    func testOtherYear() {
        let calendar = Calendar.current
        let date = calendar.date(from: DateComponents(year: 2021, month: 1, day: 1, hour: 9, minute: 0))!
        let result = date.formattedDisplayTime()
        XCTAssertEqual(result, "21年1月1日")
    }
}

