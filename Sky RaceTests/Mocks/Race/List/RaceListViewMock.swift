//
//  RaceListViewMock.swift
//  Sky RaceTests
//

import XCTest
import UIKit
@testable import Sky_Race

class RaceListViewMock: RaceListViewProtocol {
	private let expectation: XCTestExpectation
	private let presenter: RaceListPresenterProtocol
	private let raceMock: Race?
	private let segueMock: UIStoryboardSegue?
	
	init(expectation: XCTestExpectation,
		 presenter: RaceListPresenterProtocol,
		 raceMock: Race? = nil,
		 segueMock: UIStoryboardSegue? = nil) {
		self.expectation = expectation
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
		self.expectation.fulfill()
	}
	
	func showAlert(title: String, message: String) {
		self.expectation.fulfill()
	}
	
	func startLoading() {
		self.expectation.fulfill()
	}
	
	func stopLoading() {
		self.expectation.fulfill()
	}
}
