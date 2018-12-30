//
//  RaceListInteractorTests.swift
//  Sky RaceTests
//

import XCTest
@testable import Sky_Race

class RaceListInteractorTests: XCTestCase {
	func testInitOK() {
		// given
		let expectation = XCTestExpectation(description: "mock")
		let result: Result<String> = .success(nil)
		let networkService = NetworkServiceMock(expectation: expectation, resultMock: result)
		
		// when
		let _ = RaceListInteractor(networkService: networkService)
		
		// then
		// nothing crashes
	}
	
	func testGetRacesOK() {
		// given
		let expectation = XCTestExpectation(description: "get-races-ok")
		let horse = Horse(name: "pangare", sex: "m")
		let ride = Ride(clothNumber: 7, horse: horse, handicap: "4/7")
		let race = Race(name: "mock race", date: "today", time: "now", rides: [ride])
		let racesMock = [race, race, race]
		let result: Result<[Race]> = .success(racesMock)
		let networkService = NetworkServiceMock(expectation: expectation, resultMock: result)
		let interactor = RaceListInteractor(networkService: networkService)
		
		// when
		interactor.getRaces { result in
			// then
			switch result {
			case .success(let races):
				XCTAssertNotNil(races)
				XCTAssertEqual(races!.count, racesMock.count)
			case .error:
				XCTFail()
			}
		}
		
		// then
		wait(for: [expectation], timeout: 0.1)
	}
	
	func testGetRacesWhenResultIsSuccessButValueIsNil() {
		// given
		let expectation = XCTestExpectation(description: "get-races-when-value-is-nil")
		let result: Result<[Race]> = .success(nil)
		let networkService = NetworkServiceMock(expectation: expectation, resultMock: result)
		let interactor = RaceListInteractor(networkService: networkService)
		
		// when
		interactor.getRaces { result in
			// then
			switch result {
			case .success:
				XCTFail()
			case .error:
				break
			}
		}
		
		// then
		wait(for: [expectation], timeout: 0.1)
	}
	
	func testGetRacesWhenResultIsError() {
		let expectation = XCTestExpectation(description: "get-races-when-result-is-error")
		let result: Result<[Race]> = .error(nil)
		let networkService = NetworkServiceMock(expectation: expectation, resultMock: result)
		let interactor = RaceListInteractor(networkService: networkService)
		
		// when
		interactor.getRaces { result in
			// then
			switch result {
			case .success:
				XCTFail()
			case .error:
				break
			}
		}
		
		// then
		wait(for: [expectation], timeout: 0.1)
	}
}
