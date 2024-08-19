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

    var image: Image? {
        didSet {
            detailedView?.iconContainer.image = UIImage(named: "\(image?.path ?? "").\(String(describing: image?.thumbnailExtension?.rawValue))")
        }
    }

    var comicName: ComicSummary? {
        didSet {
            detailedView?.listOfComics.text = "Comics: (\(String(describing: comicName?.name)))"
        }
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
        detailedView?.activityIndictor.stopAnimating()
    }
}
