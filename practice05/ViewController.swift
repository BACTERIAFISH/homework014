//
//  ViewController.swift
//  practice05
//
//  Created by FISH on 2019/3/16.
//  Copyright © 2019 FISH. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var flowerButton: UIButton!
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    var ans: Int?
    var count = 0
    var showBool = true
    
    let speechSynth = AVSpeechSynthesizer()
    let startUtterance = AVSpeechUtterance(string: "請點擊花瓣")
    let loveUtterance1 = AVSpeechUtterance(string: "愛我")
    let loveUtterance2 = AVSpeechUtterance(string: "不愛我")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flowerButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        ans = Int.random(in: 1...10)
        print(ans!)
        
        startUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        loveUtterance1.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        loveUtterance2.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speechSynth.speak(startUtterance)
    }
    
    @IBAction func pressFlowerButton(_ sender: Any) {
        count += 1
        if count == ans {
            flowerButton.isHidden = true
        }
        if showBool {
            flowerButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 5 / 8)
            showLabel.text = "愛我"
            showBool.toggle()
            speechSynth.speak(loveUtterance1)
        } else {
            flowerButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 3 / 8)
            showLabel.text = "不愛我"
            showBool.toggle()
            speechSynth.speak(loveUtterance2)
        }
        
    }
    
    @IBAction func pressRestartButton(_ sender: Any) {
        flowerButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        ans = Int.random(in: 1...10)
        showLabel.text = "請點擊花瓣"
        showBool = true
        flowerButton.isHidden = false
        count = 0
        print(ans!)
        speechSynth.speak(startUtterance)
    }
    
}

