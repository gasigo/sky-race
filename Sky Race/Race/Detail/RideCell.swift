//
//  RideCell.swift
//  Sky Race
//

import UIKit

class RideCell: UITableViewCell {
	@IBOutlet weak var clothNumberLabel: UILabel!
	@IBOutlet weak var horseNameLabel: UILabel!
	@IBOutlet weak var horseSexLabel: UILabel!
	@IBOutlet weak var handicapLabel: UILabel!
	
	func configure(clothNumber: String, horseName: String, horseSex: String, handicap: String) {
		self.clothNumberLabel.text = clothNumber
		self.horseNameLabel.text = horseName
		self.horseSexLabel.text = horseSex
		self.handicapLabel.text = handicap
	}
}
