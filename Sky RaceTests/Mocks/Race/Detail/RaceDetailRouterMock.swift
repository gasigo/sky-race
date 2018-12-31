//
//  RaceDetailRouterMock.swift
//  Sky RaceTests
//

import XCTest
@testable import Sky_Race

struct RaceDetailRouterMock: RaceDetailRouterProtocol {
	private let expectation: XCTestExpectation?
	
	init(expectation: XCTestExpectation? = nil) {
		self.expectation = expectation
	}
	
	func routeToRaceDetailView(using url: URL) {
		self.expectation?.fulfill()
	}
}
