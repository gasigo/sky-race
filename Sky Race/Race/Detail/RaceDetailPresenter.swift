//
//  RaceDetailPresenter.swift
//  Sky Race
//

import Foundation

protocol RaceDetailPresenterProtocol {
	func handleLoad(for: RaceDetailViewProtocol)
	func handleOrderAction()
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
		// TODO
	}
	
	func handleHorseSelectAction() {
		guard let url = URL(string: Constants.skybetURL.rawValue) else {
			fatalError("Unable to create sky bet url.")
		}
		
		self.router.routeToRaceDetailView(using: url)
	}
	
	enum Constants: String {
		case skybetURL = "https://m.skybet.com/horse-racing"
	}
}
