//
//  RaceDetailRouter.swift
//  Sky Race
//

import Foundation

protocol RaceDetailRouterProtocol {
	func routeToRaceDetailView(using url: URL)
}

struct RaceDetailRouter: RaceDetailRouterProtocol {
	private weak var view: RaceDetailViewProtocol!
	
	init(view: RaceDetailViewProtocol) {
		self.view = view
	}
	
	func routeToRaceDetailView(using url: URL) {
		// TODO
	}
}
