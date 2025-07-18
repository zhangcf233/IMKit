//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import Foundation

extension Date {
    func formattedDisplayTime() -> String {
        let calendar = Calendar.current
        let now = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "zh_CN")
        
        if calendar.isDateInToday(self) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: self)
        } else if calendar.isDateInYesterday(self) {
            dateFormatter.dateFormat = "HH:mm"
            return "昨天 " + dateFormatter.string(from: self)
        } else {
            let thisYear = calendar.component(.year, from: now)
            let messageYear = calendar.component(.year, from: self)
            
            if thisYear == messageYear {
                dateFormatter.dateFormat = "M月d日"
                return dateFormatter.string(from: self)
            } else {
                dateFormatter.dateFormat = "yy年M月d日"
                return dateFormatter.string(from: self)
            }
        }
    }
}


