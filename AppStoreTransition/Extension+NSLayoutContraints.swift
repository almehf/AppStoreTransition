//
//  Extension+NSLayoutContraints.swift
//  AppStoreTransition
//
//  Created by Fahad Almehawas on 2/18/19.
//  Copyright © 2019 Fahad Almehawas. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    static func pinToView(view: UIView) -> [NSLayoutConstraint] {
        let attr : [NSLayoutConstraint.Attribute] = [NSLayoutConstraint.Attribute.top, NSLayoutConstraint.Attribute.bottom, NSLayoutConstraint.Attribute.leading, NSLayoutConstraint.Attribute.trailing]
            return attr.compactMap({
                    NSLayoutConstraint(item: view, attribute: $0, relatedBy: .equal, toItem: view.superview, attribute:  $0, multiplier: 1, constant: 0) })
        }
    }
