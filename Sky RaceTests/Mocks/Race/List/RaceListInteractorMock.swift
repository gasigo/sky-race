//
//  RaceListInteractorMock.swift
//  Sky RaceTests
//

import XCTest
@testable import Sky_Race

struct RaceListInteractorMock: RaceListInteractorProtocol {
	private let expectation: XCTestExpectation?
	private let resultMock: Result<[Race]>?
	
	init(expectation: XCTestExpectation? = nil, resultMock: Result<[Race]>? = nil) {
		self.expectation = expectation
		self.resultMock = resultMock
	}
	
	func getRaces(callback: @escaping (Result<[Race]>) -> Void) {
		self.expectation?.fulfill()
		callback(self.resultMock!)
	}
}
