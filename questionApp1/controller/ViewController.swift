//
//  ViewController.swift
//  questionApp1
//
//  Created by 松島優希 on 2020/08/19.
//  Copyright © 2020 松島優希. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NowScoreDelegate {
    
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var MaxScoreLabel: UILabel!
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    
    let imagesList = ImagesList()
    
    //IBActionで検知した正答がどちらなのかを取得する変数
    var pickedAnswer = false
    
    var soundFile = SoundFile() //音声ファイル
    
    var changeColor = ChangeColor()
    var grandientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grandientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0, bottomR: 0.54, bottomG: 0.74, bottomB: 0.74, bottomAlpha: 1.0)
        
        grandientLayer.frame = view.bounds
        view.layer.insertSublayer(grandientLayer, at: 0)
        
        imageView.layer.cornerRadius = 20
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
            
        }else{
            
        }
        
        MaxScoreLabel.text = String(maxScore)
        
    }

    @IBAction func answer(_ sender: Any) {
        if (sender as AnyObject).tag == 1{
            
            pickedAnswer = true
            
            //効果音
            soundFile.playSound(fileName: "maruSound", extensionName: "mp3")
            
        }else if (sender as AnyObject).tag == 2{
            
             pickedAnswer = false
            
            //効果音
            soundFile.playSound(fileName: "batsuSound", extensionName: "mp3")
        }
        
        //チェック 回答があっているか(pickedAnswerとImagesListのcorrectOrNotの値が一致しているかどうか
        check()
        nextQuestions()
        
        
    }
    
    func check(){
        
        let correctAnswer = imagesList.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            
            print("正解")
            correctCount = correctCount + 1
            
        }else{
            
            print("間違い")
            wrongCount = wrongCount + 1
        }
        
    }
    
    func nextQuestions(){
        if questionNumber <= 9{
            
            questionNumber += 1
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
            
        }else{
            print("問題が終了")
            //画面遷移
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    func nowScore(score: Int) {
        
        soundFile.playSound(fileName: "sound", extensionName: "mp3")
        MaxScoreLabel.text = String(score)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "next"{
            
            let nextVC = segue.destination as! NextViewController
            
            nextVC.correctedCount = correctCount
            nextVC.wrongCount = wrongCount
            nextVC.delegate = self
        }
    }
    
}

