//
//  RaceListPresenterTests.swift
//  Sky RaceTests
//

import XCTest
import UIKit
@testable import Sky_Race

class RaceListPresenterTests: XCTestCase {
	func testInitOK() {
		// given
		let router = RaceListRouterMock()
		let interactor = RaceListInteractorMock()
		
		// when
		let _ = RaceListPresenter(interactor: interactor, router: router)
		
		// then
		// nothing crashes
	}
	
	func testHandleLoadOK() {
		// given
		let viewExpectations = [XCTestExpectation(description: RaceListViewMock.ExpectationConstants.startLoading.rawValue),
								XCTestExpectation(description: RaceListViewMock.ExpectationConstants.stopLoading.rawValue),
								XCTestExpectation(description: RaceListViewMock.ExpectationConstants.load.rawValue)]
		let interactorExpecation = XCTestExpectation(description: "interactor-expecation")
		let router = RaceListRouterMock()
		let horse = Horse(name: "pangare", sex: "m")
		let ride = Ride(clothNumber: 7, horse: horse, handicap: "4/7", odds: "11/1", form: "form")
		let race = Race(name: "mock race", date: "today", time: "now", rides: [ride])
		let racesMock = [race, race, race]
		let result: Result<[Race]> = .success(racesMock)
		let interactor = RaceListInteractorMock(expectation: interactorExpecation, resultMock: result)
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		let view = RaceListViewMock(expectations: viewExpectations, presenter: presenter)
		
		// when
		view.callHandleLoad()
		
		// then
		wait(for: [interactorExpecation], timeout: 0.1)
		wait(for: viewExpectations, timeout: 0.1)
	}
	
	func testHandleLoadWhenInteractorResultValueIsNil() {
		// given
		let viewExpectations = [XCTestExpectation(description: RaceListViewMock.ExpectationConstants.startLoading.rawValue),
								XCTestExpectation(description: RaceListViewMock.ExpectationConstants.stopLoading.rawValue),
								XCTestExpectation(description: RaceListViewMock.ExpectationConstants.showAlert.rawValue)]
		let interactorExpecation = XCTestExpectation(description: "interactor-expecation")
		let router = RaceListRouterMock()
		let result: Result<[Race]> = .success(nil)
		let interactor = RaceListInteractorMock(expectation: interactorExpecation, resultMock: result)
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		let view = RaceListViewMock(expectations: viewExpectations, presenter: presenter)
		
		// when
		view.callHandleLoad()
		
		// then
		wait(for: [interactorExpecation], timeout: 0.1)
		wait(for: viewExpectations, timeout: 0.1)
	}
	
	func testHandleLoadWhenInteractorResultIsError() {
		// given
		let viewExpectations = [XCTestExpectation(description: RaceListViewMock.ExpectationConstants.startLoading.rawValue),
								XCTestExpectation(description: RaceListViewMock.ExpectationConstants.stopLoading.rawValue),
								XCTestExpectation(description: RaceListViewMock.ExpectationConstants.showAlert.rawValue)]
		let interactorExpecation = XCTestExpectation(description: "interactor-expecation")
		let router = RaceListRouterMock()
		let result: Result<[Race]> = .error(nil)
		let interactor = RaceListInteractorMock(expectation: interactorExpecation, resultMock: result)
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		let view = RaceListViewMock(expectations: viewExpectations, presenter: presenter)
		
		// when
		view.callHandleLoad()
		
		// then
		wait(for: [interactorExpecation], timeout: 0.1)
		wait(for: viewExpectations, timeout: 0.1)
	}
	
	func testHandleSegueOK() {
		// given
		let routerExpectation = XCTestExpectation(description: "mock")
		let router = RaceListRouterMock(expectation: routerExpectation)
		let horse = Horse(name: "pangare", sex: "m")
		let ride = Ride(clothNumber: 7, horse: horse, handicap: "4/7", odds: "11/1", form: "form")
		let race = Race(name: "mock race", date: "today", time: "now", rides: [ride])
		let segue = UIStoryboardSegue(identifier: RaceListPresenter.Constants.segueIdentifier.rawValue,
									  source: UIViewController(),
									  destination: UIViewController())
		let interactor = RaceListInteractorMock()
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		
		let view = RaceListViewMock(presenter: presenter, raceMock: race, segueMock: segue)
		
		// when
		view.callHandleSegue()
		
		// then
		wait(for: [routerExpectation], timeout: 0.1)
	}
	
	func testHandleSegueWhenSegueIdentifierIsWrong() {
		// given
		let routerExpectation = XCTestExpectation(description: "mock")
		routerExpectation.isInverted = true
		let router = RaceListRouterMock()
		let horse = Horse(name: "pangare", sex: "m")
		let ride = Ride(clothNumber: 7, horse: horse, handicap: "4/7", odds: "11/1", form: "form")
		let race = Race(name: "mock race", date: "today", time: "now", rides: [ride])
		let segue = UIStoryboardSegue(identifier: "wrong value",
									  source: UIViewController(),
									  destination: UIViewController())
		let interactor = RaceListInteractorMock()
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		
		let view = RaceListViewMock(presenter: presenter, raceMock: race, segueMock: segue)
		
		// when
		view.callHandleSegue()
		
		// then
		wait(for: [routerExpectation], timeout: 0.1)
	}
}
