//
//  RaceListView.swift
//  Sky Race
//

import UIKit

protocol RaceListViewProtocol: class {
	func load(races: [Race])
	func showAlert(title: String, message: String)
	func startLoading()
	func stopLoading()
}

class RaceListView: UITableViewController, RaceListViewProtocol {
	private var presenter: RaceListPresenterProtocol!
	private var races: [Race] = []
	private let activityIndicator = UIActivityIndicatorView(style: .gray)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.setupLoadingView()
		self.presenter.handleLoad(for: self)
    }
	
	private func setupLoadingView() {
		self.activityIndicator.center = self.navigationController?.view.center ?? self.view.center
		self.view.addSubview(self.activityIndicator)
	}
	
	func set(presenter: RaceListPresenterProtocol) {
		self.presenter = presenter
	}
	
	// MARK: - Interface Implementation
	
	func load(races: [Race]) {
		self.races = races
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
	func showAlert(title: String, message: String) {
		DispatchQueue.main.async {
			let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
			self.present(alert, animated: true, completion: nil)
		}
	}
	
	func startLoading() {
		DispatchQueue.main.async {
			self.activityIndicator.startAnimating()
		}
	}
	
	func stopLoading() {
		DispatchQueue.main.async {
			self.activityIndicator.stopAnimating()
		}
	}
	
	// MARK: - UITableView Methods
	
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.races.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let raceCell =
			tableView.dequeueReusableCell(withIdentifier: RaceCell.reusableIdentifier, for: indexPath) as? RaceCell else {
			fatalError("Could't dequeue \(RaceCell.reusableIdentifier) at RaceListView")
		}
		let race = self.races[indexPath.row]
		raceCell.configure(name: race.name, hour: race.time, date: race.date, ridesCount: race.rides.count.description)
        return raceCell
    }
	
	// MARK: - UIStoryboard
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let index = self.tableView.indexPathForSelectedRow else {
			return
		}
		
		self.presenter.handle(segue: segue, race: self.races[index.row])
	}
}
