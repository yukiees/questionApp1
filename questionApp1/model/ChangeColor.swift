//
//  ChangeColor.swift
//  questionApp1
//
//  Created by 松島優希 on 2020/08/21.
//  Copyright © 2020 松島優希. All rights reserved.
//

import Foundation
import UIKit

class ChangeColor{
    
    func changeColor(topR:CGFloat, topG:CGFloat, topB:CGFloat,topAlpha:CGFloat,
                     bottomR:CGFloat, bottomG:CGFloat, bottomB:CGFloat,bottomAlpha:CGFloat)->CAGradientLayer{
        
        //グラデーションの開始色
        let topColor = UIColor(red: topR, green: topG, blue: topB, alpha: topAlpha)
        
        
        let bottomColor = UIColor(red: bottomR, green: bottomG, blue: bottomB, alpha: bottomAlpha)
        
        let gradientColor = [topColor.cgColor,bottomColor.cgColor]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        
        return gradientLayer
        
    }
}
