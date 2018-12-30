//
//  RequestData.swift
//  Sky Race
//

protocol RequestData {
	var method: HTTPMethod { get }
	var host: String { get }
	var path: String { get }
	var header: [String: String]? { get }
	var queryParameters: [String: String]? { get }
}
