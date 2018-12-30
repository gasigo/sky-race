//
//  RaceCell.swift
//  Sky Race
//

import UIKit

class RaceCell: UITableViewCell {
	@IBOutlet private weak var nameLabel: UILabel!
	@IBOutlet private weak var hourLabel: UILabel!
	@IBOutlet private weak var dateLabel: UILabel!
	@IBOutlet private weak var ridesCountLabel: UILabel!
	
	static let reusableIdentifier = "RaceCell"
	
	func configure(name: String, hour: String, date: String, ridesCount: String) {
		self.nameLabel.text = name
		self.hourLabel.text = hour
		self.dateLabel.text = date
		self.ridesCountLabel.text = ridesCount
	}
}
