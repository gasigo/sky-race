//
//  RaceDetailView.swift
//  Sky Race
//

import UIKit

class RaceDetailView: UIViewController {
	@IBOutlet private weak var dateLabel: UILabel!
	@IBOutlet private weak var scheduleLabel: UILabel!
	@IBOutlet private weak var tableView: UITableView!
	private var rides: [Ride] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	func set(rides: [Ride]) {
		self.rides = rides
	}
	
	@IBAction func didTapOrderButton(_ sender: Any) {
		
	}
}

extension RaceDetailView: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.rides.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let rideCell =
			tableView.dequeueReusableCell(withIdentifier: RideCell.reusableIdentifier, for: indexPath) as? RideCell else {
				fatalError("Could't dequeue \(RideCell.reusableIdentifier) at RaceDetailView")
		}
		
		let ride = self.rides[indexPath.row]
		rideCell.configure(clothNumber: ride.clothNumber.description,
						   horseName: ride.horse.name,
						   horseSex: ride.horse.sex,
						   handicap: ride.handicap)
		return rideCell
	}
}
