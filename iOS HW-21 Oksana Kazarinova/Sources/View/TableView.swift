//
//  TableView.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import UIKit

class TableView: UIView {

    // MARK: - Outlets

    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Type the character here"
        bar.keyboardType = .webSearch
        bar.searchTextField.clearButtonMode = .never
        bar.enablesReturnKeyAutomatically = false
        bar.sizeToFit()
        bar.showsCancelButton = false
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    lazy var activityIndictor: UIActivityIndicatorView = {
        let activitySign = UIActivityIndicatorView()
        activitySign.style = .medium
        activitySign.hidesWhenStopped = true
        activitySign.translatesAutoresizingMaskIntoConstraints = false
        return activitySign
    }()


    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(mainTableView)
        addSubview(searchBar)
        addSubview(activityIndictor)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            mainTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            activityIndictor.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndictor.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
