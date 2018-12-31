//
//  RaceDetailPresenter.swift
//  Sky Race
//

import Foundation

protocol RaceDetailPresenterProtocol {
	func handleLoad(for: RaceDetailViewProtocol)
	func handleOrderAction()
	func handleOrderOptionSelectAction(option: OrderOption)
	func handleHorseSelectAction()
}

class RaceDetailPresenter: RaceDetailPresenterProtocol {
	private let rides: [Ride]
	private let router: RaceDetailRouterProtocol
	private weak var view: RaceDetailViewProtocol!
	
	init(rides: [Ride], router: RaceDetailRouterProtocol) {
		self.rides = rides
		self.router = router
	}
	
	func handleLoad(for view: RaceDetailViewProtocol) {
		self.view = view
		self.view.load(rides: self.rides)
	}
	
	func handleOrderAction() {
		self.view.presentActionSheet(title: Constants.order.rawValue, options: [.clothNumber, .form, .odd])
	}
	
	func handleOrderOptionSelectAction(option: OrderOption) {
		switch option {
		case .clothNumber:
			let orderedRides = self.rides.sorted(by: { $0.clothNumber < $1.clothNumber })
			self.view.load(rides: orderedRides)
		case .odd:
			let orderedRides =
				self.rides.sorted(by: { $0.odds.stringFractionToDouble() > $1.odds.stringFractionToDouble() })
			self.view.load(rides: orderedRides)
		case .form:
			// I did not understand this field and how it works, so I'm ordering alphabetically/
			let orderedRides = self.rides.sorted(by: { $0.form < $1.form })
			self.view.load(rides: orderedRides)
		}
	}
	
	func handleHorseSelectAction() {
		guard let url = URL(string: Constants.skybetURL.rawValue) else {
			fatalError("Unable to create sky bet url.")
		}
		
		self.router.routeToRaceDetailView(using: url)
	}
	
	enum Constants: String {
		case skybetURL = "https://m.skybet.com/horse-racing"
		case order = "Order"
	}
}

enum OrderOption: String {
	case clothNumber = "Cloth Number"
	case odd = "Odd"
	case form = "Form"
}

fileprivate extension String {
	func stringFractionToDouble() -> Double {
		let numbers = self.components(separatedBy: "/")
		let leftSide = Double(numbers[0]) ?? 0
		let rightSide = Double(numbers[1]) ?? 1
		return leftSide / rightSide
	}
}
