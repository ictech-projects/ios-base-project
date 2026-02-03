//
//  Date+toString.swift
//  HJK
//
//  Created by Ewide Dev 5 on 17/09/25.
//

import Foundation

extension Date {
	func toString(format: DateFormat) -> String {
		let formatter = DateFormatter()
		formatter.locale = Locale.current
		formatter.dateFormat = format.rawValue
		formatter.amSymbol = "AM"
		formatter.pmSymbol = "PM"
		formatter.locale = Locale(identifier: "en_US_POSIX")
		
		return formatter.string(from: self)
	}
}
