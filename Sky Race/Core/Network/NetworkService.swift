//
//  NetworkService.swift
//  Sky Race
//

import Foundation

protocol NetworkServiceProtocol {
	func request<T: Decodable>(with: RequestData, responseType: T.Type, handler: @escaping (Result<T>) -> Void)
}

struct NetworkService: NetworkServiceProtocol {
	func request<T: Decodable>(with requestData: RequestData,
							   responseType: T.Type,
							   handler: @escaping (Result<T>) -> Void) {
		guard var url = URL(string: requestData.host + requestData.path) else {
			handler(.error(NetworkError.invalidURL))
			return
		}
		
		url = url.append(queryParameters: requestData.queryParameters)
		
		var request = URLRequest(url: url)
		request.httpMethod = requestData.method.rawValue
		
		URLSession.shared.dataTask(with: request) { (data, _, error) in
			guard error == nil else {
				handler(.error(error))
				return
			}
			
			guard let data = data else {
				handler(.error(NetworkError.emptyResponse))
				return
			}
			
			let decoder = JSONDecoder()
			guard let result = try? decoder.decode(T.self, from: data) else {
				handler(.error(NetworkError.unableToSerialize))
				return
			}
			
			handler(.success(result))
		}.resume()
	}
}

fileprivate extension URL {
	func append(queryParameters: [String: String]?) -> URL {
		
		guard let queryParameters = queryParameters,
			var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
				return self
		}
		
		var mutableQueryItems: [URLQueryItem] = urlComponents.queryItems ?? []
		mutableQueryItems.append(contentsOf: queryParameters.map{ URLQueryItem(name: $0, value: $1) })
		urlComponents.queryItems = mutableQueryItems
		return urlComponents.url!
	}
}
