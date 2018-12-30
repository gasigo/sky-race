//
//  Race.swift
//  Sky Race
//

struct Race: Codable {
	let name: String
	let date: String
	let time: String
	let rides: [Ride]
}
