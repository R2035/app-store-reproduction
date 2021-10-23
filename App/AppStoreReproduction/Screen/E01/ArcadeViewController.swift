//
//  ArcadeViewController.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import UIKit

/// E01 Arcade
final class ArcadeViewController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = L10n.E01.title

        navigationController?.navigationBar.prefersLargeTitles = true

        collectionView.backgroundColor = .systemBackground
    }
}
