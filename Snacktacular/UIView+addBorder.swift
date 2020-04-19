//
//  UIView+addBorder.swift
//  Snacktacular
//
//  Created by Hannah Jiang on 4/15/20.
//  Copyright © 2020 John Gallaugher. All rights reserved.
//

import Foundation
import UIKit //need to have UIKit to use UIView and other UI stuff

extension UIView {
    func addBorder(width: CGFloat, radius: CGFloat, color: UIColor){
        self.layer.borderWidth = width //self = the view
        self.layer.borderColor = color.cgColor //cgColor will convert it to the type of color we need
        self.layer.cornerRadius = radius
        
    }
    
    func noBorder() {
        self.layer.borderWidth = 0.0
    }
}
