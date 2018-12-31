//
//  RideDetailBuilder.swift
//  Sky Race
//

struct RaceDetailBuilder {
	static func setupRaceDetail(view: RaceDetailView, rides: [Ride]) {
		let router = RaceDetailRouter(view: view)
		let presenter = RaceDetailPresenter(rides: rides, router: router)
		view.set(presenter: presenter)
	}
}
