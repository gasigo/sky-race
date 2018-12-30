//
//  RaceRequestData.swift
//  Sky Race
//

enum RaceRequestData: RequestData {
	
	case getRaces
	
	var method: HTTPMethod {
		switch self {
		case .getRaces:
			return .get
		}
	}
	
	var host: String {
		return "https://api.myjson.com"
	}
	
	var path: String {
		switch self {
		case .getRaces:
			return "/bins/1dgdk4"
		}
	}
	
	var header: [String : String]? {
		return nil
	}
	
	var queryParameters: [String : String]? {
		return nil
	}
}
