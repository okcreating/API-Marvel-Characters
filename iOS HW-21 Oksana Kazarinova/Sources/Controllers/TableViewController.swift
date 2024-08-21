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
    let networkManager = NetworkManager()

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
        hideKeyboardWhenTappedAround()
    }

    // MARK: Getting Data

    func getData() {
        networkManager.getData { results in
                switch results {
                case .success(let characters):
                    self.decodedData = characters
                        print(self.decodedData?.count ?? "0 in decoded")
                    self.filteredData = self.decodedData
                    self.mainView.mainTableView.reloadData()
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
        filteredData = decodedData
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

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

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        mainView.searchBar.endEditing(true)
    }
}

extension TableViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            return
        } else {
            filteredData = decodedData?.filter { $0.name!.lowercased().contains(searchText.lowercased())
            }
            print(filteredData?.count as Any)
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
        mainView.endEditing(true)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(filteredData?.count as Any)

        if filteredData?.count == 0 {
            let alert = UIAlertController(title: "Not found", message: "Try to change search filter", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Got it!", style: .cancel)
            alert.addAction(cancelAction)
            present(alert, animated: true)
            searchBar.text = ""
            filteredData = decodedData
            mainView.mainTableView.reloadData()
        } else {
            mainView.endEditing(true)
        }
    }
}


