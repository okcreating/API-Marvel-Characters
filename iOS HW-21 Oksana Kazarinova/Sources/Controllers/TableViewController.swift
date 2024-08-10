//
//  TableViewController.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import UIKit

class TableViewController: UITableViewController {

    var decodedData: [Character]?
    var networkManager = NetworkManager()

    private weak var mainView: TableView! {
        guard isViewLoaded else { return nil }
        return (view as? TableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = TableView()
        decodedData = [Character]()
        configure()
        mainView.activityIndictor.startAnimating()
        networkManager.dataWorkout()
    }
}


private extension TableViewController {
    func configure() {
        mainView.mainTableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        mainView.mainTableView.dataSource = self
        mainView.mainTableView.delegate = self

        title = "Marvel Characters"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        decodedData?.count ?? 0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = decodedData?[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell
        cell.
        cell = decodedData.character.
        mainView?.activityIndictor.stopAnimating()
            return cell ?? UITableViewCell()

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = decodedData?[indexPath.row]

            let detailedController = DetailViewController()
            tableView.deselectRow(at: indexPath, animated: true)
            detailedController.detailedModel = setting
            navigationController?.pushViewController(detailedController, animated: true)
            }
}
