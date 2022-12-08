//
//  InitialViewController.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

final class InitialViewController: UIViewController {

    // MARK: - UIElements
    private let bgImageView = UIImageView()
    
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
        self.bgImageView.contentMode = .scaleAspectFill
        self.bgImageView.image = UIImage(named: "Launch")
    }
    
    private func setupActions() { }
    
    private func applyStyles() {
        self.view.backgroundColor = UIColor.clear
    }
    
    private func configureSubviews() {
        self.view.addSubview(self.bgImageView)
    }
    
    private func configureConstraints() {
        self.bgImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
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
