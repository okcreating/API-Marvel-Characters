//
//  TableViewController.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import UIKit

class TableViewController: UITableViewController {

    var models: [Character]?

    private weak var mainView: View! {
        guard isViewLoaded else { return nil }
        return (view as? View)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = View()
     //   model = Character()
        configure()
    }
}

private extension TableViewController {
    func configure() {
        mainView.mainTableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        mainView.mainTableView.dataSource = self
        mainView.mainTableView.delegate = self

        title = "Marvel"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models?.count ?? 0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = models?[0][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell
        cell?. = character
            return cell ?? UITableViewCell()

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = model?.createModels()[indexPath.section][indexPath.row]

            let detailedController = DetailViewController()
            tableView.deselectRow(at: indexPath, animated: true)
            detailedController.detailedModel = setting
            navigationController?.pushViewController(detailedController, animated: true)
            }
}
