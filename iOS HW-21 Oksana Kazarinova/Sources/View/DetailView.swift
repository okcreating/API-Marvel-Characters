//
//  DetailView.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import UIKit

class DetailView: UIView {

    lazy var name: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
       label.textColor = .white
       label.textAlignment = .center
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()

    lazy var characterCode: UILabel = {
       let label = UILabel()
       label.font = .systemFont(ofSize: 10, weight: .regular)
       label.textColor = .black
       label.textAlignment = .center
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()

    lazy var infoAboutObject: UILabel = {
       let label = UILabel()
       label.font = .systemFont(ofSize: 10, weight: .semibold)
       label.textColor = .black
       label.textAlignment = .center
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()

    lazy var listOfComics: UILabel = {
       let label = UILabel()
       label.font = .systemFont(ofSize: 16, weight: .regular)
       label.textColor = .black
       label.textAlignment = .left
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()


    lazy var iconContainer: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.tintColor = .white
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.white.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var icon: UIImage = {
        let image = UIImage()
        return image
    }()

   // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

   // MARK: - Setup

   private func setupHierarchy() {
       addSubview(name)
       addSubview(characterCode)
       addSubview(iconContainer)
       addSubview(infoAboutObject)
       addSubview(listOfComics)

   }

   private func setupLayout() {
       NSLayoutConstraint.activate([
           message.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           message.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           message.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
           message.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),

           detailedIcon.widthAnchor.constraint(equalToConstant: 70),
           detailedIcon.heightAnchor.constraint(equalToConstant: 70),
           detailedIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           detailedIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -120)
       ])
   }

//    func configureView(with model: Setting) {
//        message.text = "Thank you. You pressed \(model.name.rawValue)."
//        switch model.name {
//        case .blueTooth, .siriAndSearch, .homeScreen:
//            detailedIcon.image = UIImage(named: model.icon)
//            backgroundColor = .black
//        default:
//            detailedIcon.image = icon.editIcon(imageName: model.icon)
//            backgroundColor = UIColor.init(hex: model.imageViewColorCode)
//        }
    }

