//
//  DetailViewController.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import UIKit

class DetailViewController: UIViewController {

    var detailedModel: Character?

     weak var detailedView: DetailView? {
        guard isViewLoaded else { return nil }
        return view as? DetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = DetailView()
        cofigureView()
    }
}

extension DetailViewController {
    func cofigureView() {
        guard let models = detailedModel else { return }
        detailedView?.configureView(with: models)
        cofigureImage()
        cofigureComicsList()
        detailedView?.activityIndictor.stopAnimating()
    }
}

extension DetailViewController {
    func cofigureImage() {
        var image: Image? {
            didSet {
                detailedView?.iconContainer.image = UIImage(named: "\(image?.path ?? "").\(image?.extension ?? "")")
            }
        }
    }
}

extension DetailViewController {
    func cofigureComicsList() {
            var comicName: ComicSummary? {
                didSet {
                    detailedView?.listOfComics.text = "Comics: (\(String(describing: comicName?.name)))"
                }
            }
    }
}
