//
//  Ride.swift
//  Sky Race
//

struct Ride: Codable {
	let clothNumber: Int
	let horse: Horse
	let handicap: String
	let odds: String
	let form: String
	
	enum CodingKeys: String, CodingKey {
		case clothNumber = "cloth_number"
		case horse
		case handicap
		case odds = "current_odds"
		case form = "formsummary"
	}
}
