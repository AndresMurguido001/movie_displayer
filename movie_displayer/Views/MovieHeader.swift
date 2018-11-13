//
//  MovieHeader.swift
//  movie_displayer
//
//  Created by andres murguido on 11/11/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    func dropShadow(scale: Bool = true, width: CGFloat = -1, height: CGFloat = 5) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

class MovieCollectionHeader: UICollectionViewCell {
    
    static let id = "Header"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.dropShadow()
        setupHeaderViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let movielbl: UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir Next", size: 24)
        lbl.text = "Top Movies"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let icon: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "rightArrow")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let view: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.myRgba(r: 216, g: 221, b: 239, a: 1)
        return v
    }()
    
    func setupHeaderViews(){
        addSubview(view)
        addSubview(movielbl)
        addSubview(icon)
        
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        movielbl.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
//        movielbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        movielbl.rightAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: rightAnchor, multiplier: 0.33).isActive = true
        movielbl.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movielbl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        icon.leftAnchor.constraint(equalTo: movielbl.rightAnchor, constant: 10).isActive = true
        icon.heightAnchor.constraint(equalToConstant: self.frame.height/2).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        icon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
}
