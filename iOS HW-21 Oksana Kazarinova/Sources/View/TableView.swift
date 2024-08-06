//
//  TableView.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import UIKit

class View: UIView {

    // MARK: - Outlets

    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemRed
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(mainTableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: self.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
