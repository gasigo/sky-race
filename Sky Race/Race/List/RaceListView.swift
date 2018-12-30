//
//  RaceListView.swift
//  Sky Race
//

import UIKit

class RaceListView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let raceCell =
			tableView.dequeueReusableCell(withIdentifier: RaceCell.reusableIdentifier, for: indexPath) as? RaceCell else {
			fatalError("Could't dequeue \(RaceCell.reusableIdentifier) at RaceListView")
		}

		raceCell.configure(name: "Teste", hour: "14:50h", date: "2019-01-22", ridesCount: "8")
        return raceCell
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

	}
}
