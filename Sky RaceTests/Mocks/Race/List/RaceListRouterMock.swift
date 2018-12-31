//
//  RaceListRouterMock.swift
//  Sky RaceTests
//

import XCTest
@testable import Sky_Race

struct RaceListRouterMock: RaceListRouterProtocol {
	private let expectation: XCTestExpectation?
	
	init(expectation: XCTestExpectation? = nil) {
		self.expectation = expectation
	}
	
	func routeToRaceDetailView(using segue: UIStoryboardSegue, race: Race) {
		self.expectation?.fulfill()
	}
}
