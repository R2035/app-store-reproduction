//
//  GameViewController.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import UIKit

/// C01 ゲーム
final class GameViewController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = L10n.C01.title

        collectionView.backgroundColor = .systemBackground
    }
}
