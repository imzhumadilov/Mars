//
//  ImageViewController.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ImageViewController: UIViewController {

    // MARK: - UIElements
    private let backButton = UIButton()
    private let photoLabel = UILabel()
    private let idLabel = UILabel()
    private let photoImageView = UIImageView()
    
    // MARK: - Props
    public var viewModel: ImageViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupComponents()
        self.setupActions()
        self.configureSubviews()
        self.configureConstraints()
        self.bindViewModel()
        
        self.viewModel?.viewIsReady()
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    private func setupComponents() {
        self.backButton.setImage(UIImage(named: "ArrowLeftWhite"), for: .normal)
        
        self.photoLabel.text = "Photo ID"
    }
    
    private func setupActions() {
        self.backButton.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
    }
    
    private func applyStyles() {
        self.view.backgroundColor = UIColor.black
        
        self.photoLabel.textColor = .white
        self.photoLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        self.idLabel.textColor = .white
        self.idLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    private func configureSubviews() {
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.photoLabel)
        self.view.addSubview(self.idLabel)
        self.view.addSubview(self.photoImageView)
    }
    
    private func configureConstraints() {
        self.backButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        self.photoLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(4)
            $0.centerX.equalToSuperview()
        }
        self.idLabel.snp.makeConstraints {
            $0.top.equalTo(self.photoLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        self.photoImageView.snp.makeConstraints {
            $0.top.equalTo(self.idLabel.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Module functions
    private func bindViewModel() {
        self.viewModel?.setupData = { [weak self] id, imageURL in
            guard let self = self else { return }
            self.idLabel.text = id
            self.photoImageView.kf.setImage(with: URL(string: imageURL))
        }
    }
}

// MARK: - Actions
extension ImageViewController {
    
    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
