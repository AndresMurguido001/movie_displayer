//
//  Movie.swift
//  movie_displayer
//
//  Created by andres murguido on 11/10/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit

struct Movie {
    var name: String
    var released: String
    var duration: String
    var image: UIImage
    
    init(name: String, released: String, duration: String, image: String) {
        self.name = name
        self.released = released
        self.duration = duration
        self.image = UIImage(named: image)!
    }
}
