//
//  MovieCollectionLayou.swift
//  movie_displayer
//
//  Created by andres murguido on 11/11/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit
//
class MovieCollectionLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        self.sectionHeadersPinToVisibleBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
