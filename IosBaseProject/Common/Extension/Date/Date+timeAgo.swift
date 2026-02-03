//
//  Date+timeAgo.swift
//  HJK
//
//  Created by Ewide Dev 5 on 19/09/25.
//

import Foundation

extension Date {
	func timeAgo() -> String {
		let formatter = DateComponentsFormatter()
		formatter.unitsStyle = .full
		formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
		formatter.maximumUnitCount = 1
		
		let now = Date()
		let timeInterval = now.timeIntervalSince(self)
		
		guard let formattedString = formatter.string(from: timeInterval) else {
			return "Just now"
		}
		
		return "\(formattedString) ago"
	}
}
