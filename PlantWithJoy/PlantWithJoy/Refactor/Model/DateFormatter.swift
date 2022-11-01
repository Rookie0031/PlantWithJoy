//
//  DateFormatter.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/06.
//

import Foundation

extension Date {
    var dayText: String {
        let dayText = formatted(date: .numeric, time: .omitted)
        return String(dayText)
    }
}
