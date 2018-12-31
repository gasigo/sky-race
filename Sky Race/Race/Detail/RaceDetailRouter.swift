//
//  RaceDetailRouter.swift
//  Sky Race
//

import Foundation

protocol RaceDetailRouterProtocol {
	func routeToRaceDetailView(using url: URL)
}

struct RaceDetailRouter: RaceDetailRouterProtocol {
	private weak var view: RaceDetailView!
	
	init(view: RaceDetailView) {
		self.view = view
	}
	
	func routeToRaceDetailView(using url: URL) {
		let webview = WebView(url: url)
		self.view.navigationController?.pushViewController(webview, animated: true)
	}
}
