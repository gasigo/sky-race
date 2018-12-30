//
//  RaceListRouter.swift
//  Sky Race
//

import UIKit

protocol RaceListRouterProtocol {
	func routeToRaceDetailView(using segue: UIStoryboardSegue, race: Race)
}

struct RaceListRouter: RaceListRouterProtocol {
	func routeToRaceDetailView(using segue: UIStoryboardSegue, race: Race) {
		// TODO
	}
}
