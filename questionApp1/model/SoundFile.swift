//
//  SoundFile.swift
//  questionApp1
//
//  Created by 松島優希 on 2020/08/21.
//  Copyright © 2020 松島優希. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile{
    
    var player:AVAudioPlayer?
    
    func playSound(fileName:String,extensionName:String){
        
        //再生する。
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        
        do {
            
            //効果音をならす。
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
            
        } catch{
            
            print("エラーです!")
            
        }
    }
}
