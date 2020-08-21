//
//  NextViewController.swift
//  questionApp1
//
//  Created by 松島優希 on 2020/08/19.
//  Copyright © 2020 松島優希. All rights reserved.
//

import UIKit

protocol  NowScoreDelegate {
    func nowScore(score:Int)
}

class NextViewController: UIViewController {
    
    
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    var delegate:NowScoreDelegate!
    
    var correctedCount: Int!
    var wrongCount: Int!
    var beforeCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongCount)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
        
            beforeCount = (UserDefaults.standard.object(forKey: "beforeCount") as! Int)
             
        }
    }
        
    
    @IBAction func back(_ sender: Any) {
        
        //もし、最高得点であれば、入れ替え
        if beforeCount < correctedCount{
            
            UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
            delegate.nowScore(score:correctedCount)
            
        }else if beforeCount > correctedCount{
            
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
            delegate.nowScore(score:correctedCount)
            
        }
        
        //そうでない場合は、そのまま
        self.dismiss(animated: true, completion: nil)
    }
    

}
