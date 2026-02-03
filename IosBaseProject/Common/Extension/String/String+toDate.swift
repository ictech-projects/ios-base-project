//
//  String+toDate.swift
//  Boxwise
//
//  Created by Ewide Dev 5 on 05/11/25.
//

import Foundation

extension String {
	func toDate(format: DateFormat) -> Date {
		let formatter = DateFormatter()
		formatter.locale = Locale.current
		formatter.dateFormat = format.rawValue
		
		return formatter.date(from: self) ?? Date()
	}
}
