//
//  imagesModel.swift
//  questionApp1
//
//  Created by 松島優希 on 2020/08/21.
//  Copyright © 2020 松島優希. All rights reserved.
//

import Foundation


class ImagesModel{
    
    //画像名を取得して、その画像名が人間かそうでないかをフラグによって判定するための機能
    
    let imageText:String
    let answer:Bool
    
    init(imageName:String,correctOrNot:Bool){
        
        imageText = imageName
        
        answer = correctOrNot
        
    }
}
