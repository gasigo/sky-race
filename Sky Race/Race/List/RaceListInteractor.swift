//
//  RaceListInteractor.swift
//  Sky Race
//

protocol RaceListInteractorProtocol {
	func getRaces(callback: @escaping (Result<[Race]>) -> Void)
}

struct RaceListInteractor: RaceListInteractorProtocol {
	private let networkService: NetworkServiceProtocol
	
	init(networkService: NetworkServiceProtocol) {
		self.networkService = networkService
	}
	
	func getRaces(callback: @escaping (Result<[Race]>) -> Void) {
		self.networkService.request(with: RaceRequestData.getRaces,
									responseType: [Race].self) { result in
			switch result {
			case .success(let races):
				guard let races = races else {
					callback(.error(nil))
					return
				}
				
				callback(.success(races))
			case .error(let error):
				callback(.error(error))
			}
		}
	}
}
