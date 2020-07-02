//
//  GPCalendarComponent.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 01/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current

let day = calendar.component(.day, from: date)
//var weekday = calendar.component(.weekday, from: date) - 1
var weekday = calendar.component(.weekday, from: date)
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)
