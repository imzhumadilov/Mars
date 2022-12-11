//
//  SettingsViewController.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - UIElements
    private let bgImageView = UIImageView()
    private let cameraView = PickerView()
    private let dateView = PickerView()
    private let exploreButton = UIButton()
    
    // MARK: - Props
    public var viewModel: SettingsViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupComponents()
        self.setupActions()
        self.configureSubviews()
        self.configureConstraints()
        self.bindViewModel()
        
        self.viewModel?.viesIsReady()
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    private func setupComponents() {
        self.navigationController?.navigationBar.isHidden = true
        
        self.bgImageView.contentMode = .scaleAspectFill
        self.bgImageView.image = UIImage(named: "SettingsBg")
        
        self.cameraView.configurePicker(title: "Rover Camera", type: .camera, delegate: self)
        
        self.dateView.configurePicker(title: "Date", type: .date, delegate: self)
        
        self.exploreButton.backgroundColor = UIColor(hex: "#BF2E0E")
        self.exploreButton.setTitleColor(.white, for: .normal)
        self.exploreButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        self.exploreButton.setTitle("Explore", for: .normal)
        self.exploreButton.layer.cornerRadius = 10
        self.exploreButton.clipsToBounds = true
    }
    
    private func setupActions() {
        self.exploreButton.addTarget(self, action: #selector(self.exploreButtonTapped), for: .touchUpInside)
    }
    
    private func applyStyles() {
        self.view.backgroundColor = UIColor.clear
    }
    
    private func configureSubviews() {
        self.view.addSubview(self.bgImageView)
        self.view.addSubview(self.cameraView)
        self.view.addSubview(self.dateView)
        self.view.addSubview(self.exploreButton)
    }
    
    private func configureConstraints() {
        self.bgImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.cameraView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-48)
        }
        self.dateView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview().offset(48)
        }
        self.exploreButton.snp.makeConstraints {
            $0.top.equalTo(self.dateView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(60)
        }
    }
    
    // MARK: - Module functions
    private func bindViewModel() {
        self.viewModel?.setupCameraList = { [weak self] list in
            self?.cameraView.configureList(list)
        }
    }
}

// MARK: - Actions
extension SettingsViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in })
        alertController.addAction(action)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
    
    @objc
    private func exploreButtonTapped() {
        self.viewModel?.exploreButtonTapped()
    }
}


// MARK: - PickerFieldDelegate
extension SettingsViewController: PickerFieldDelegate {
    
    func provideData(textField: UITextField, row: Int) {
        self.viewModel?.provideCamera(row: row)
    }
    
    func provideDate(textField: UITextField, date: Date) {
        self.viewModel?.provideDate(date)
    }
}
