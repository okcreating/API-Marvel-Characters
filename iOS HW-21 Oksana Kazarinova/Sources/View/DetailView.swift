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

    lazy var activityIndictor: UIActivityIndicatorView = {
        let activitySign = UIActivityIndicatorView()
        activitySign.isAnimating = true
        activitySign.style = .medium
        activitySign.hidesWhenStopped = true
        return activitySign
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
       addSubview(activityIndictor)
   }

   private func setupLayout() {
       NSLayoutConstraint.activate([
           name.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           name.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
           name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
           name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),

           characterCode.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
           characterCode.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
           characterCode.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),

           iconContainer.widthAnchor.constraint(equalToConstant: 100),
           iconContainer.heightAnchor.constraint(equalToConstant: 100),
           iconContainer.topAnchor.constraint(equalTo: characterCode.bottomAnchor,constant: 15),
           iconContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor),

           infoAboutObject.topAnchor.constraint(equalTo: iconContainer.bottomAnchor, constant: 10),
           infoAboutObject.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
           infoAboutObject.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),

           listOfComics.topAnchor.constraint(equalTo: infoAboutObject.bottomAnchor, constant: 10),
           listOfComics.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
           listOfComics.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),

           activityIndictor.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           activityIndictor.centerYAnchor.constraint(equalTo: self.centerYAnchor)
       ])
   }

//    func configureView(with model: Setting) {
//        message.text = "Thank you. You pressed \(model.name.rawValue)."
//            detailedIcon.image = UIImage(named: model.icon)
//            backgroundColor = .black        
    }

