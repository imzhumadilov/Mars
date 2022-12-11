//
//  PickerView.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//

import UIKit

enum PickerType {
    case camera
    case date
}

class PickerView: UIView {
    
    // MARK: - UIElemnts
    private let titleLabel = UILabel()
    private let bgView = UIView()
    private let pickerField = PickerField()
    private let iconImageView = UIImageView()
    
    // MARK: - Props
    
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
        
        self.titleLabel.textColor = .black
        self.titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        self.bgView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        self.bgView.layer.cornerRadius = 10
        self.bgView.clipsToBounds = true
        
        self.iconImageView.image = UIImage(named: "DropDown")
    }
    
    private func configureSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.bgView)
        self.bgView.addSubview(self.iconImageView)
        self.bgView.addSubview(self.pickerField)
    }
    
    private func configureConstraints() {
        self.titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(24)
        }
        self.bgView.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(4)
            $0.height.equalTo(60)
        }
        self.iconImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        self.pickerField.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
    }
    
    func configurePicker(title: String, type: PickerType) {
        self.titleLabel.text = title
        self.pickerField.configure(type: type)
    }
    
    func configureList(_ list: [String]) {
        self.pickerField.setupList(list: list)
    }
}
