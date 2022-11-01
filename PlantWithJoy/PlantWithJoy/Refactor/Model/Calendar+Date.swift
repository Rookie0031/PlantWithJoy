//
//  CalendarAndDate.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/07.
//

import Foundation

let calendar = Calendar(identifier: .gregorian)
let weekDayOfToday = calendar.component(.weekday, from: Date())
