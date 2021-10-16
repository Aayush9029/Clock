//
//  Date+Extensions.swift
//  Clock
//
//  Created by Aayush Pokharel on 2021-10-15.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
