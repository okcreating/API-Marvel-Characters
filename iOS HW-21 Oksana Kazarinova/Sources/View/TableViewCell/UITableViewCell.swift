//
//  UITableViewCell.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 06/08/2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"

//    var setting: Setting? {
//        didSet {
//            settingName.text = setting?.name.rawValue
//            settingIcon.backgroundColor = UIColor.init(hex: setting?.imageViewColorCode ?? "")
//            setupIcon()
//        }
//    }

   // MARK: - Outlets

    private var name: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private var icon: UIImage = {
        let image = UIImage()
        return image
    }()

    private var imageContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var objectDescription: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 11, weight: .light)
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: TableViewCell.identifier)
        icon.withTintColor(.systemRed, renderingMode: .automatic)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(imageContainer)
        addSubview(name)
        addSubview(objectDescription)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            imageContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            imageContainer.widthAnchor.constraint(equalToConstant: 30),
            imageContainer.heightAnchor.constraint(equalToConstant: 30),

            name.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 20),
            name.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),

            objectDescription.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 20),
            objectDescription.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            objectDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4)
        ])
    }

//        private func setupIcon() {
//            switch setting?.name {
//            case .blueTooth, .siriAndSearch, .homeScreen:
//                settingIcon.image = UIImage(named: setting?.icon ?? "")
//            default:
//                settingIcon.image = icon.editIcon(imageName: setting?.icon ?? "")
//                }
//            }

    // MARK: - Reuse

    override func prepareForReuse() {
        self.accessoryType = .none
    }
}

