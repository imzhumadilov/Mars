//
//  UIView+.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 13.12.2022.
//

import UIKit

extension UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
