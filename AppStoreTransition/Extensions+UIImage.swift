//
//  Extensions+UIImage.swift
//  AppStoreTransition
//
//  Created by Fahad Almehawas on 2/18/19.
//  Copyright © 2019 Fahad Almehawas. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    func imageWith(newSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size:newSize)
        let image = renderer.image {_ in
            draw(in: CGRect.init(origin: CGPoint.zero, size: newSize))
            
        }
        return image
    }
}
