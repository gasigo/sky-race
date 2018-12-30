//
//  RaceListPresenter.swift
//  Sky Race
//

// It's being imported here to make possible work with Storyboards.
import UIKit.UIStoryboardSegue

protocol RaceListPresenterProtocol {
	func handleLoad(for view: RaceListViewProtocol)
	func handle(segue: UIStoryboardSegue, race: Race)
}

class RaceListPresenter: RaceListPresenterProtocol {
	private let interactor: RaceListInteractorProtocol
	private let router: RaceListRouterProtocol
	private weak var view: RaceListViewProtocol!
	
	init(interactor: RaceListInteractorProtocol, router: RaceListRouterProtocol) {
		self.interactor = interactor
		self.router = router
	}
	
	func handleLoad(for view: RaceListViewProtocol) {
		self.view = view
		
		self.view.startLoading()
		self.interactor.getRaces { result in
			self.view.stopLoading()
			switch result {
			case .success(let races):
				guard let races = races else {
					self.view.showAlert(title: Constants.errorTitle.rawValue, message: Constants.errorMessage.rawValue)
					return
				}
				
				self.view.load(races: races)
			case .error:
				self.view.showAlert(title: Constants.errorTitle.rawValue, message: Constants.errorMessage.rawValue)
			}
		}
	}
	
	func handle(segue: UIStoryboardSegue, race: Race) {
		guard segue.identifier == "RaceDetailView" else {
			return
		}
		
		self.router.routeToRaceDetailView(using: segue, race: race)
	}
	
	enum Constants: String {
		case errorTitle = "Error"
		case errorMessage = "Could't fetch races data."
	}
}
