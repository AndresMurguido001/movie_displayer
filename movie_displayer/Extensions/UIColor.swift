//
//  UIColor.swift
//  movie_displayer
//
//  Created by andres murguido on 11/11/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit

extension UIColor {
    class func myRgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

class GradientView: UIView {
    
    var startColor: CGColor = UIColor.myRgba(r: 69, g: 182, b: 156, a: 1).cgColor
    
    var endColor: CGColor = UIColor.myRgba(r: 33, g: 209, b: 159, a: 1).cgColor

    var gl: CAGradientLayer = CAGradientLayer()
    
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    

    
    
}
