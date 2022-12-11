//
//  PickerField.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//

import UIKit

protocol PickerFieldDelegate: AnyObject {
    func getData(textField: UITextField, text: String?)
    func getData(textField: UITextField, row: Int)
}

class PickerField: UITextField {
    
    // MARK: - Properties
    private let pickerView = UIPickerView()
    private let datePickerView = UIDatePicker()
    private var type: PickerType = .camera
    private var list: [String] = []
    private var row: Int = 0
    public weak var pickerDelegate: PickerFieldDelegate?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupPickerField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup functions
    public func setupPickerField() {
        self.textColor = .black
        self.tintColor = .clear
        self.font = .systemFont(ofSize: 18, weight: .regular)
        self.delegate = self
        
        self.pickerView.delegate = self
        
        self.datePickerView.datePickerMode = .date
        if #available(iOS 13.4, *) { self.datePickerView.preferredDatePickerStyle = .wheels }
        self.datePickerView.addTarget(self, action: #selector(self.datePickerChanged), for: .valueChanged)
    }
    
    private func getData() {
        self.pickerDelegate?.getData(textField: self, text: self.text)
        self.pickerDelegate?.getData(textField: self, row: self.row)
    }
    
    func setupList(list: [String]) {
        self.list = list
    }
    
    func configure(type: PickerType) {
        switch type {
        case .camera:
            self.inputView = self.pickerView
        case .date:
            self.inputView = self.datePickerView
        }
    }
    
    func setupValue(row: Int) {
        guard self.list.count > row else { return }
        self.text = self.list[row]
        self.pickerView.selectRow(row, inComponent: 0, animated: true)
    }
    
    @objc
    func datePickerChanged() {
        print(#function)
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension PickerField: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard self.list.count > row else { return }
        self.text = self.list[row]
    }
}

// MARK: - UITextFieldDelegate
extension PickerField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !self.list.isEmpty { self.getData() }
    }
}
