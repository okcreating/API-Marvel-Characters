//
//  TableViewController.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import UIKit

class TableViewController: UIViewController {

    var decodedData: [Character]?
    var filteredData: [Character]?
    var networkManager = NetworkManager()

// MARK: Outlets

    private weak var mainView: TableView! {
        guard isViewLoaded else { return nil }
        return (view as? TableView)
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = TableView()
        mainView.activityIndictor.startAnimating()
        getData()
        configureTableView()
        configureSearchBar()
    }

    func getData() {
        networkManager.getData { results in
                switch results {
                case .success(let characters):
                    self.decodedData = characters
                        print(self.decodedData?.count ?? "0 in decoded")
                    self.filteredData = self.decodedData
                    self.mainView.mainTableView.reloadData()
                    print("filtered = decoded")
                    print(self.filteredData?.count ?? "0 in filtered")
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}

// MARK: Extensions

private extension TableViewController {
    func configureTableView() {
        mainView.mainTableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        mainView.mainTableView.dataSource = self
        mainView.mainTableView.delegate = self
        title = "Marvel Characters"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func configureSearchBar() {
        mainView.searchBar.delegate = self
//        decodedData = [Character]()
//        filteredData = [Character]()
        filteredData = decodedData
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData?.count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = filteredData?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell
        cell?.character = character
        //cell?.image = character?.thumbnail
        mainView?.activityIndictor.stopAnimating()
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = filteredData?[indexPath.row]
        let detailedController = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        detailedController.detailedModel = character
        navigationController?.pushViewController(detailedController, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}

extension TableViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            return
        } else {
            filteredData = filteredData?.filter { $0.name!.lowercased().contains(searchText.lowercased())
            }
        mainView.mainTableView.reloadData()
        }

//        filteredData = searchText.isEmpty ? decodedData : decodedData?.filter { (name: String) -> Bool in
//            return name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        filteredData = decodedData
        mainView.mainTableView.reloadData()
        searchBar.resignFirstResponder()
    }
}


