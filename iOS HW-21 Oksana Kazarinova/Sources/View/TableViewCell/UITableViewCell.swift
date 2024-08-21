//
//  UITableViewCell.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 06/08/2024.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"

    var character: Character? {
        didSet {
            name.text = character?.name
            objectDescription.text = character?.description
            downoadImage()
        }
    }

   // MARK: - Outlets

    private var name: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        name.textColor = .systemRed
        name.preferredMaxLayoutWidth = 240
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
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
        description.numberOfLines = 2
        description.textAlignment = .left
        description.preferredMaxLayoutWidth = 240
        description.lineBreakMode = .byTruncatingTail
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TableViewCell.identifier)
        selectionStyle = .none
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(name)
        addSubview(objectDescription)
        addSubview(imageContainer)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageContainer.widthAnchor.constraint(equalToConstant: 75),
            imageContainer.heightAnchor.constraint(equalToConstant: 75),

            name.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 10),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),

            objectDescription.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 10),
            objectDescription.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5)
        ])
    }

    private func downoadImage() {
        guard let imagePath = self.character?.thumbnail?.path,
              let imageExtension = self.character?.thumbnail?.thumbnailExtension,
              let imageURL = URL(string: "\(imagePath).\(imageExtension)")
        else { return }

        imageContainer.kf.setImage(with: imageURL)
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        self.imageContainer.image = nil
        self.name.text = nil
        self.objectDescription.text = nil
    }
}
