//
//  SearchFindCell.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import Reusable
import SnapKit
import UIKit

final class SearchFindCell: UITableViewCell, Reusable {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()

    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .systemBackground

        contentView.addSubview(titleLabel)
        contentView.addSubview(separator)

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        separator.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview()
            make.height.equalTo(1 / UIScreen.main.scale)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(title: String, isSeparatorHidden: Bool) {
        titleLabel.text = title
        separator.isHidden = isSeparatorHidden
    }
}
