//
//  RaceDetailViewMock.swift
//  Sky RaceTests
//

import XCTest
@testable import Sky_Race

class RaceDetailViewMock: RaceDetailViewProtocol {
	private let expectations: [XCTestExpectation]
	private let presenter: RaceDetailPresenterProtocol
	
	init(expectations: [XCTestExpectation] = [], presenter: RaceDetailPresenterProtocol) {
		self.expectations = expectations
		self.presenter = presenter
	}
	
	func callHandleLoad() {
		self.presenter.handleLoad(for: self)
	}
	
	func callHandleOrderAction() {
		self.presenter.handleOrderAction()
	}
	
	func callHandleHorseSelectAction() {
		self.presenter.handleHorseSelectAction()
	}
	
	func load(rides: [Ride]) {
		guard let expectation =
			self.expectations.first(where: { $0.description == ExpectationConstants.load.rawValue }) else {
				return
		}
		
		expectation.fulfill()
	}
	
	enum ExpectationConstants: String {
		case load
	}
}
