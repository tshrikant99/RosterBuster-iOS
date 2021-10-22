//
//  DateFormatter.swift
//  RosterBusterTest
//
//  Created by shrikant on 12/10/21.
//

import Foundation

var jsonDateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone(identifier: "UTC")
    formatter.dateFormat = "dd/MM/yyyy"
    return formatter
}


var displayDateFormatter : DateFormatter {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "E dd MMM. yyyy"
    return formatter
}
