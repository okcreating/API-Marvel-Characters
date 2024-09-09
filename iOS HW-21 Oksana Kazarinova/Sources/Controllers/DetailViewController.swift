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
        detailedView?.activityIndictor.stopAnimating()
    }
}
