//
//  InitialViewController.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class InitialViewController: UIViewController {

    // MARK: - UIElements
    
    // MARK: - Props
    public var viewModel: InitialViewModel?
    
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
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupActions() { }
    
    private func applyStyles() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func configureSubviews() { }
    
    private func configureConstraints() { }
    
    // MARK: - Module functions
    private func bindViewModel() {
        self.viewModel?.openMainVC = { [weak self] in
            guard let self = self else { return }
            let vc = SettingsConfigurator.create()
            SettingsConfigurator.configure(with: vc)
            vc.modalPresentationStyle = .overFullScreen
            
            DispatchQueue.main.async {
                self.present(vc, animated: false)
            }
        }
    }
}

// MARK: - Actions
extension InitialViewController { }
