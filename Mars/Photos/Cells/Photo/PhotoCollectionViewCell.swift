//
//  PhotoCollectionViewCell.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Kingfisher

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UIElemnts
    private let photoImageView = UIImageView()
    private let cellButton = UIButton()

    // MARK: - Props
    public var model: CollectionCellIdentifiable? {
        didSet {
            self.updateViews()
        }
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
        self.configureSubviews()
        self.configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup functions
    private func setupView() {
        self.backgroundColor = .clear
        
        self.photoImageView.contentMode = .scaleAspectFill
        self.photoImageView.layer.cornerRadius = 8
        self.photoImageView.clipsToBounds = true
        
        self.cellButton.addTarget(self, action: #selector(self.cellButtonTapped), for: .touchUpInside)
    }

    private func configureSubviews() {
        self.contentView.addSubview(self.photoImageView)
        self.contentView.addSubview(self.cellButton)
    }

    private func configureConstraints() {
        self.photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        self.cellButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func updateViews() {
        guard let model = self.model as? PhotoCollectionViewCellModel else { return }
        self.photoImageView.kf.setImage(with: URL(string: model.imageURL))
    }

    // MARK: - Actions
    @objc
    private func cellButtonTapped() {
        guard let model = self.model as? PhotoCollectionViewCellModel else { return }
        model.action?()
    }
}
