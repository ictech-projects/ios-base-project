//
//  ErrorResponse.swift
//  HJK
//
//  Created by Ewide Dev 5 on 11/09/25.
//

import Foundation

struct ErrorResponse: Codable, Error {
	let statusCode: Int?
    let message: String?
    let data: ErrorFieldData?
	
	enum CodingKeys: String, CodingKey {
		case statusCode = "status_code"
		case message
		case data
	}
}

struct ErrorFieldData: Codable {
    let email: [String]?
    let password: [String]?
}
