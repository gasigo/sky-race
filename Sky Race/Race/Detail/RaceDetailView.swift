//
//  RaceDetailView.swift
//  Sky Race
//

import UIKit

protocol RaceDetailViewProtocol: class {
	func load(rides: [Ride])
	func presentActionSheet(title: String, options: [OrderOption])
}

class RaceDetailView: UIViewController, RaceDetailViewProtocol {
	@IBOutlet private weak var dateLabel: UILabel!
	@IBOutlet private weak var scheduleLabel: UILabel!
	@IBOutlet private weak var tableView: UITableView!
	private var rides: [Ride] = []
	private var presenter: RaceDetailPresenterProtocol!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.presenter.handleLoad(for: self)
    }
	
	func set(presenter: RaceDetailPresenterProtocol) {
		self.presenter = presenter
	}
	
	func load(rides: [Ride]) {
		self.rides = rides
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
	func presentActionSheet(title: String, options: [OrderOption]) {
		let actionSheet = UIAlertController(title: "Order", message: nil, preferredStyle: .actionSheet)
		
		for option in options {
			actionSheet.addAction(UIAlertAction(title: option.rawValue, style: .default, handler: { action in
				self.presenter.handleOrderOptionSelectAction(option: option)
			}))
		}
		
		actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		self.present(actionSheet, animated: true, completion: nil)
	}
	
	@IBAction func didTapOrderButton(_ sender: Any) {
		self.presenter.handleOrderAction()
	}
}

extension RaceDetailView: UITableViewDataSource, UITableViewDelegate {
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
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.presenter.handleHorseSelectAction()
	}
}
