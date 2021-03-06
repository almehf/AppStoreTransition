//
//  CardViewModel.swift
//  AppStoreTransition
//
//  Created by Fahad Almehawas on 2/18/19.
//  Copyright © 2019 Fahad Almehawas. All rights reserved.
//

import UIKit
enum CardViewMode {
    case full
    case card
}

class CardViewModel {
    
    var viewMode: CardViewMode = .card
    var title: String? = nil
    var subtitle: String? = nil
    var description: String? = nil
    var backgroundImage: UIImage? = nil
    
    init(backGroundImage : UIImage, title:String, subtitle: String, description: String) {
        
        self.backgroundImage = backGroundImage.imageWith(newSize: CGSize(width: 375, height: 450))
        self.title = title
        self.subtitle = subtitle
        self.description = description
    }
    
    init(initWithCopy model : CardViewModel) {
        self.backgroundImage = model.backgroundImage
        self.title = model.title
        self.subtitle = model.subtitle
        self.description = model.description
        self.viewMode = model.viewMode
    }
}


