//
//  WithoutMP3.swift
//  questionApp1
//
//  Created by 松島優希 on 2020/08/21.
//  Copyright © 2020 松島優希. All rights reserved.
//

import Foundation
class WithoutMP3: SoundFile{
    
    override func playSound(fileName: String, extensionName: String) {
        
        if extensionName == "mp3"{
        
        print("このファイルは再生できません")
        
    }
    
        player?.stop()
    
    }
    
    
}
