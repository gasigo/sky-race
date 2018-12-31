//
//  RaceListViewMock.swift
//  Sky RaceTests
//

import XCTest
import UIKit
@testable import Sky_Race

class RaceListViewMock: RaceListViewProtocol {
	private let expectations: [XCTestExpectation]
	private let presenter: RaceListPresenterProtocol
	private let raceMock: Race?
	private let segueMock: UIStoryboardSegue?
	
	init(expectations: [XCTestExpectation] = [],
		 presenter: RaceListPresenterProtocol,
		 raceMock: Race? = nil,
		 segueMock: UIStoryboardSegue? = nil) {
		self.expectations = expectations
		self.presenter = presenter
		self.raceMock = raceMock
		self.segueMock = segueMock
	}
	
	func callHandleLoad() {
		self.presenter.handleLoad(for: self)
	}
	
	func callHandleSegue() {
		self.presenter.handle(segue: self.segueMock!, race: self.raceMock!)
	}
	
	func load(races: [Race]) {
		guard let expectation =
			self.expectations.first(where: { $0.description == ExpectationConstants.load.rawValue }) else {
			return
		}
		
		expectation.fulfill()
	}
	
	func showAlert(title: String, message: String) {
		guard let expectation =
			self.expectations.first(where: { $0.description == ExpectationConstants.showAlert.rawValue }) else {
				return
		}
		
		expectation.fulfill()
	}
	
	func startLoading() {
		guard let expectation =
			self.expectations.first(where: { $0.description == ExpectationConstants.startLoading.rawValue }) else {
				return
		}
		
		expectation.fulfill()
	}
	
	func stopLoading() {
		guard let expectation =
			self.expectations.first(where: { $0.description == ExpectationConstants.stopLoading.rawValue }) else {
				return
		}
		
		expectation.fulfill()
	}
	
	enum ExpectationConstants: String {
		case load
		case showAlert
		case startLoading
		case stopLoading
	}
}
