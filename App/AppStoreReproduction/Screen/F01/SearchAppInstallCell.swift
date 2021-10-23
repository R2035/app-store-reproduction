//
//  SearchAppInstallCell.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import Reusable
import SnapKit
import UIKit

final class SearchAppInstallCell: UITableViewCell, Reusable {
    private lazy var appInstallView: AppInstallView = {
        let view = AppInstallView()
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .systemBackground

        contentView.addSubview(appInstallView)

        appInstallView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(imageURL: String, title: String, description: String, installStatus: String, warning: String) {
        appInstallView.update(imageURL: imageURL, title: title, description: description, installStatus: installStatus, warning: warning)
    }
}
