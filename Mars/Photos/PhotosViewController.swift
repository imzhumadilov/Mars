//
//  PhotosViewController.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import MBProgressHUD

final class PhotosViewController: UIViewController {
    
    // MARK: - UIElements
    private let backButton = UIButton()
    private let cameraLabel = UILabel()
    private let dateLabel = UILabel()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Props
    public var viewModel: PhotosViewModel?
    private var sections: [CollectionSectionModel] = []
    
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
        self.backButton.setImage(UIImage(named: "ArrowLeft"), for: .normal)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.backgroundColor = .clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(PhotoCollectionViewCell.self)
    }
    
    private func setupActions() {
        self.backButton.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
    }
    
    private func applyStyles() {
        self.view.backgroundColor = UIColor(hex: "#DCCEBE")
        
        self.cameraLabel.textColor = .black
        self.cameraLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        self.dateLabel.textColor = .black
        self.dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    private func configureSubviews() {
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.cameraLabel)
        self.view.addSubview(self.dateLabel)
        self.view.addSubview(self.collectionView)
    }
    
    private func configureConstraints() {
        self.backButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        self.cameraLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(4)
            $0.centerX.equalToSuperview()
        }
        self.dateLabel.snp.makeConstraints {
            $0.top.equalTo(self.cameraLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        self.collectionView.snp.makeConstraints {
            $0.top.equalTo(self.dateLabel.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Module functions
    private func bindViewModel() {
        self.viewModel?.loadDataCompletion = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let sections):
                self.sections = sections
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
            DispatchQueue.main.async { MBProgressHUD.hide(for: self.navigationController?.view ?? self.view, animated: true) }
        }
        
        self.viewModel?.setupNavBar = { [weak self] camera, date in
            guard let self = self else { return }
            self.cameraLabel.text = camera
            self.dateLabel.text = date
        }
        
        self.viewModel?.showLoader = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async { MBProgressHUD.showAdded(to: self.navigationController?.view ?? self.view, animated: true) }
        }
        
        self.viewModel?.hideLoader = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async { MBProgressHUD.hide(for: self.navigationController?.view ?? self.view, animated: true) }
        }
    }
}

// MARK: - Actions
extension PhotosViewController {
    
    func showAlert(title: String, message: String) {
        MBProgressHUD.hide(for: self.navigationController?.view ?? self.view, animated: true)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in })
        alertController.addAction(action)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
    
    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = self.sections[indexPath.section].items[indexPath.item] as? PhotoCollectionViewCellModel else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as PhotoCollectionViewCell
        cell.model = model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = UIScreen.main.bounds.width / 3
        return CGSize(width: side, height: side)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
