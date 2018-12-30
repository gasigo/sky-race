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
		let expectation = XCTestExpectation(description: "mock")
		let router = RaceListRouterMock(expectation: expectation)
		let result: Result<[Race]> = .success(nil)
		let interactor = RaceListInteractorMock(expectation: expectation, resultMock: result)
		
		// when
		let _ = RaceListPresenter(interactor: interactor, router: router)
		
		// then
		// nothing crashes
	}
	
	func testHandleLoadOK() {
		// given
		let mockExpectation = XCTestExpectation(description: "mock")
		let viewExpectation = XCTestExpectation(description: "view-expectation")
		viewExpectation.expectedFulfillmentCount = 3
		let interactorExpecation = XCTestExpectation(description: "interactor-expecation")
		let router = RaceListRouterMock(expectation: mockExpectation)
		let horse = Horse(name: "pangare", sex: "m")
		let ride = Ride(clothNumber: 7, horse: horse, handicap: "4/7")
		let race = Race(name: "mock race", date: "today", time: "now", rides: [ride])
		let racesMock = [race, race, race]
		let result: Result<[Race]> = .success(racesMock)
		let interactor = RaceListInteractorMock(expectation: interactorExpecation, resultMock: result)
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		let view = RaceListViewMock(expectation: viewExpectation, presenter: presenter)
		
		// when
		view.callHandleLoad()
		
		// then
		wait(for: [viewExpectation, interactorExpecation], timeout: 0.1)
	}
	
	func testHandleLoadWhenInteractorResultValueIsNil() {
		// given
		let mockExpectation = XCTestExpectation(description: "mock")
		let viewExpectation = XCTestExpectation(description: "view-expectation")
		viewExpectation.expectedFulfillmentCount = 3
		let interactorExpecation = XCTestExpectation(description: "interactor-expecation")
		let router = RaceListRouterMock(expectation: mockExpectation)
		let result: Result<[Race]> = .success(nil)
		let interactor = RaceListInteractorMock(expectation: interactorExpecation, resultMock: result)
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		let view = RaceListViewMock(expectation: viewExpectation, presenter: presenter)
		
		// when
		view.callHandleLoad()
		
		// then
		wait(for: [viewExpectation, interactorExpecation], timeout: 0.1)
	}
	
	func testHandleLoadWhenInteractorResultIsError() {
		// given
		let mockExpectation = XCTestExpectation(description: "mock")
		let viewExpectation = XCTestExpectation(description: "view-expectation")
		viewExpectation.expectedFulfillmentCount = 3
		let interactorExpecation = XCTestExpectation(description: "interactor-expecation")
		let router = RaceListRouterMock(expectation: mockExpectation)
		let result: Result<[Race]> = .error(nil)
		let interactor = RaceListInteractorMock(expectation: interactorExpecation, resultMock: result)
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		let view = RaceListViewMock(expectation: viewExpectation, presenter: presenter)
		
		// when
		view.callHandleLoad()
		
		// then
		wait(for: [viewExpectation, interactorExpecation], timeout: 0.1)
	}
	
	func testHandleSegueOK() {
		// given
		let routerExpectation = XCTestExpectation(description: "mock")
		let viewExpectation = XCTestExpectation(description: "view-expectation")
		let interactorExpecation = XCTestExpectation(description: "interactor-expecation")
		let router = RaceListRouterMock(expectation: routerExpectation)
		let result: Result<[Race]> = .success(nil)
		let horse = Horse(name: "pangare", sex: "m")
		let ride = Ride(clothNumber: 7, horse: horse, handicap: "4/7")
		let race = Race(name: "mock race", date: "today", time: "now", rides: [ride])
		let segue = UIStoryboardSegue(identifier: RaceListPresenter.Constants.segueIdentifier.rawValue,
									  source: UIViewController(),
									  destination: UIViewController())
		let interactor = RaceListInteractorMock(expectation: interactorExpecation, resultMock: result)
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		
		let view = RaceListViewMock(expectation: viewExpectation, presenter: presenter, raceMock: race, segueMock: segue)
		
		// when
		view.callHandleSegue()
		
		// then
		wait(for: [routerExpectation], timeout: 0.1)
	}
	
	func testHandleSegueWhenSegueIdentifierIsWrong() {
		// given
		let routerExpectation = XCTestExpectation(description: "mock")
		routerExpectation.isInverted = true
		let viewExpectation = XCTestExpectation(description: "view-expectation")
		let interactorExpecation = XCTestExpectation(description: "interactor-expecation")
		let router = RaceListRouterMock(expectation: routerExpectation)
		let result: Result<[Race]> = .success(nil)
		let horse = Horse(name: "pangare", sex: "m")
		let ride = Ride(clothNumber: 7, horse: horse, handicap: "4/7")
		let race = Race(name: "mock race", date: "today", time: "now", rides: [ride])
		let segue = UIStoryboardSegue(identifier: "wrong value",
									  source: UIViewController(),
									  destination: UIViewController())
		let interactor = RaceListInteractorMock(expectation: interactorExpecation, resultMock: result)
		let presenter = RaceListPresenter(interactor: interactor, router: router)
		
		let view = RaceListViewMock(expectation: viewExpectation, presenter: presenter, raceMock: race, segueMock: segue)
		
		// when
		view.callHandleSegue()
		
		// then
		wait(for: [routerExpectation], timeout: 0.1)
	}
}
