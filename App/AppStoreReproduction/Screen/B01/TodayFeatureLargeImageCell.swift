//
//  TodayFeatureLargeImageCell.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import Reusable
import SnapKit
import UIKit

final class TodayFeatureLargeImageCell: UITableViewCell, Reusable {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 8)
        return view
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .systemGray
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()

    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        backgroundColor = .clear

        contentView.backgroundColor = .clear

        contentView.addSubview(containerView)

        containerView.addSubview(descriptionLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(thumbnailImageView)

        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 24, right: 16))
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.leading.equalTo(descriptionLabel)
            make.trailing.equalTo(descriptionLabel)
        }

        thumbnailImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
    }

    func update(description: String, title: String, imageURL: String) {
        descriptionLabel.text = description
        titleLabel.text = title
        // TODO: ?????????URL??????????????????????????????
    }
}
