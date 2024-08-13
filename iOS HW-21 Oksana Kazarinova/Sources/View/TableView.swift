//
//  TableView.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import UIKit

class TableView: UIView {

    // MARK: - Outlets

//    lazy var searchTextField: UIS = {
//        let textField = UITextField()
//        textField.placeholder = "Type the character here"
//        textField.keyboardType = .webSearch
//        textField.returnKeyType = .search
//        textField.clearButtonMode = .always
//        textField.textAlignment = .left
//        return textField
//    }()
//
//    lazy var searchButton: UIButton = {
//        let button = UIButton()
//        button.tintColor = .systemBlue
//        button.setTitle("Search", for: .normal)
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        return button
//    }()

    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        return tableView
    }()

    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Type the character here"
        bar.keyboardType = .webSearch
        bar.returnKeyType = .search
        bar.sizeToFit()
        bar.showsCancelButton = true
        //bar.backgroundColor = .systemGray
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
        self.backgroundColor = .systemGray
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
//        addSubview(searchTextField)
//        addSubview(searchButton)
        addSubview(mainTableView)
        addSubview(searchBar)
        addSubview(activityIndictor)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

//            searchTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
//            searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
//            searchTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
//
//            searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 5),
//            searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
//            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),

            mainTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            mainTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            activityIndictor.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndictor.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
