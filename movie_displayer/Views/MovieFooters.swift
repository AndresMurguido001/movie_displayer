//
//  MovieFooters.swift
//  movie_displayer
//
//  Created by andres murguido on 11/11/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit
import QuartzCore

class MovieFooter: UICollectionViewCell {
    
    static let id = "Footer"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        setupFooterView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let moreBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("More", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.myRgba(r: 114, g: 147, b: 160, a: 1)
        btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
        
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        btn.layer.shadowRadius = 5
        btn.layer.shadowOpacity = 0.5
        return btn
    }()
    
    func setupFooterView(){
        addSubview(moreBtn)
        
        moreBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        moreBtn.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: topAnchor, multiplier: 0.5).isActive = true
        
    }
}
