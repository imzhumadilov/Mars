//
//  InitialViewController.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit
import IQKeyboardManagerSwift
import Kingfisher

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
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
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
    private func bindViewModel() { }
}

// MARK: - Actions
extension InitialViewController { }
