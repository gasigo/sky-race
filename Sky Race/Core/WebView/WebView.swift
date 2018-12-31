//
//  WebView.swift
//  Sky Race
//

import UIKit
import WebKit

class WebView: UIViewController {
	@IBOutlet private weak var webView: WKWebView!
	private let url: URL
	
	init(url: URL) {
		self.url = url
		super.init(nibName: "WebView", bundle: .main)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.webView.load(URLRequest(url: self.url))
    }
}
