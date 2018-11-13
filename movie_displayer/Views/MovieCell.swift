//
//  MovieCell.swift
//  movie_displayer
//
//  Created by andres murguido on 11/10/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let id = "MovieCellId"
    
    public var movie: Movie? {
        didSet {
            if let currentMovie = movie {
                label.text = currentMovie.name
                image.image = currentMovie.image
            }
        }
    }
    
    let label: UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir Next", size: 20)
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        return lbl
    }()
    
    let image: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.shadowColor = UIColor.black.cgColor
        img.layer.shadowRadius = 12
        img.layer.shadowOpacity = 0.5
        img.layer.shadowOffset = CGSize(width: 5, height: 10)
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = UIColor.myRgba(r: 69, g: 182, b: 156, a: 0.3)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        setupCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellViews(){
        addSubview(image)

    
        image.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor).isActive = true
        image.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        

    }
    
    
}
