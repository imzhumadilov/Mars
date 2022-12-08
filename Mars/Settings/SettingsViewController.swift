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
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupActions() { }
    
    private func applyStyles() {
        self.view.backgroundColor = UIColor.green
    }
    
    private func configureSubviews() { }
    
    private func configureConstraints() { }
    
    // MARK: - Module functions
    private func bindViewModel() { }
}

// MARK: - Actions
extension SettingsViewController { }
