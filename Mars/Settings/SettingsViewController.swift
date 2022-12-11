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
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    private func setupComponents() {
        self.bgImageView.contentMode = .scaleAspectFill
        self.bgImageView.image = UIImage(named: "SettingsBg")
    
        self.cameraView.configurePicker(title: "Rover Camera", type: .camera)
        self.cameraView.configureList(["1", "2"])
        
        self.dateView.configurePicker(title: "Date", type: .date)
    }
    
    private func setupActions() { }
    
    private func applyStyles() {
        self.view.backgroundColor = UIColor.clear
    }
    
    private func configureSubviews() {
        self.view.addSubview(self.bgImageView)
        self.view.addSubview(self.cameraView)
        self.view.addSubview(self.dateView)
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
    }
    
    // MARK: - Module functions
    private func bindViewModel() { }
}

// MARK: - Actions
extension SettingsViewController { }
