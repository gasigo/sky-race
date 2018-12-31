//
//  NetworkServiceMock.swift
//  Sky RaceTests
//

import XCTest
@testable import Sky_Race

struct NetworkServiceMock<Type: Codable>: NetworkServiceProtocol {
	private let expectation: XCTestExpectation
	private let resultMock: Result<Type>
	
	init(expectation: XCTestExpectation, resultMock: Result<Type>) {
		self.expectation = expectation
		self.resultMock = resultMock
	}
	
	func request<T: Decodable>(with requestData: RequestData,
							   responseType: T.Type,
							   handler: @escaping (Result<T>) -> Void) {
		self.expectation.fulfill()
		handler(self.resultMock as! Result<T>)
	}
}
