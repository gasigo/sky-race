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
		guard let raceDetailView = segue.destination as? RaceDetailView else {
			return
		}
		
		raceDetailView.set(rides: race.rides)
	}
}
