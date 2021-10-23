//
//  SearchTitleCell.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import Reusable
import SnapKit
import UIKit

final class SearchTitleCell: UITableViewCell, Reusable {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .headline)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()

    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .clear

        contentView.addSubview(titleLabel)
        contentView.addSubview(separator)

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        separator.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.bottom).offset(8)
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

    func update(title: String) {
        titleLabel.text = title
    }
}
