//
//  RaceDetailPresenterTests.swift
//  Sky RaceTests
//

import XCTest
@testable import Sky_Race

//class RaceDetailPresenter: RaceDetailPresenterProtocol {
//	private let rides: [Ride]
//	private let router: RaceDetailRouterProtocol
//	private weak var view: RaceDetailViewProtocol!
//
//	init(rides: [Ride], router: RaceDetailRouterProtocol) {
//		self.rides = rides
//		self.router = router
//	}
//
//	func handleLoad(for view: RaceDetailViewProtocol) {
//		self.view = view
//		self.view.load(rides: self.rides)
//	}
//
//	func handleOrderAction() {
//		// TODO
//	}
//
//	func handleHorseSelectAction() {
//		guard let url = URL(string: Constants.skybetURL.rawValue) else {
//			fatalError("Unable to create sky bet url.")
//		}
//
//		self.router.routeToRaceDetailView(using: url)
//	}
//
//	enum Constants: String {
//		case skybetURL = "https://m.skybet.com/horse-racing"
//	}
//}

class RaceDetailPresenterTests: XCTestCase {
	func testInitOK() {
		// given
		let router = RaceDetailRouterMock()
		let rides: [Ride] = []
		
		// when
		let _ = RaceDetailPresenter(rides: rides, router: router)
		
		// then
		// nothing crashes
	}
	
	func testHandleLoadOK() {
		// given
		let viewExpectations = [XCTestExpectation(description: RaceDetailViewMock.ExpectationConstants.load.rawValue)]
		let router = RaceDetailRouterMock()
		let rides: [Ride] = []
		let presenter = RaceDetailPresenter(rides: rides, router: router)
		let view = RaceDetailViewMock(expectations: viewExpectations, presenter: presenter)
		
		// when
		view.callHandleLoad()
		
		// then
		wait(for: viewExpectations, timeout: 0.1)
	}
	
	func testHandleHorseSelectActionOK() {
		// given
		let routerExpectation = XCTestExpectation(description: "router-expectation")
		let router = RaceDetailRouterMock(expectation: routerExpectation)
		let rides: [Ride] = []
		let presenter = RaceDetailPresenter(rides: rides, router: router)
		let view = RaceDetailViewMock(presenter: presenter)
		
		// when
		view.callHandleHorseSelectAction()
		
		// then
		wait(for: [routerExpectation], timeout: 0.1)
	}
}
