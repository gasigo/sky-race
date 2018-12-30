//
//  Result.swift
//  Sky Race
//

enum Result<T> {
	case success(T?)
	case error(Error?)
}
