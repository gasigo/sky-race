//
//  RaceListBuilder.swift
//  Sky Race
//

import UIKit

struct RaceListBuilder {
	static func makeRaceListView() -> UIViewController {
		let storyboard = UIStoryboard(name: "Race", bundle: .main)
		
		guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController,
			let raceListView = navigationController.viewControllers.first as? RaceListView else {
			fatalError("Could't load RaceListView from stroyboard at RaceListBuilder")
		}
		
		let networkService = NetworkService()
		let interactor = RaceListInteractor(networkService: networkService)
		let router = RaceListRouter()
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		raceListView.set(presenter: presenter)
		
		return navigationController
	}
}
