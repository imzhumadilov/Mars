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
        self.viewModel?.loadDataCompletion = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let sections):
                self.sections = sections
                DispatchQueue.main.async {
//                    self.tableView.reloadDataAnimated()
                }
            case .failure(let error):
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
            DispatchQueue.main.async { MBProgressHUD.hide(for: self.navigationController?.view ?? self.view, animated: true) }
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
}
