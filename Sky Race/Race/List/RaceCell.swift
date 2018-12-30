//
//  RaceCell.swift
//  Sky Race
//

import UIKit

class RaceCell: UITableViewCell {
	@IBOutlet private weak var raceNameLabel: UILabel!
	@IBOutlet private weak var raceHourLabel: UILabel!
	@IBOutlet private weak var raceDateLabel: UILabel!
	@IBOutlet private weak var raceRidesCountLabel: UILabel!
	
	static let reusableIdentifier = "RaceCell"
	
	func configure(name: String, hour: String, date: String, ridesCount: String) {
		self.raceNameLabel.text = name
		self.raceHourLabel.text = hour
		self.raceDateLabel.text = date
		self.raceRidesCountLabel.text = ridesCount
	}
}
