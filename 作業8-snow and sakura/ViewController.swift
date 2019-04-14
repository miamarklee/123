//
//  ViewController.swift
//  作業8-snow and sakura
//
//  Created by apple on 2019/4/13.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import AVFoundation
///下面不認得AVSpeechUtterance，一般import會加在檔案的最前面
class ViewController: UIViewController {

    @IBOutlet weak var speakSlider: UIButton!
    @IBAction func buttonPressed(_sender: Any) {
// 生出要講的話
let speechUtterance=AVSpeechUtterance(string:"跟我玩球吧")
//講中文
speechUtterance.voice=AVSpeechSynthesisVoice(language: "zh-TW")
        
    speechUtterance.rate = 0.5 //說話速度
     speechUtterance.pitchMultiplier = 2.0//說話音調

//生出講話的合成器
let synthesizer = AVSpeechSynthesizer()
//下面沒寫（使用常數），會產生警告
synthesizer.speak(speechUtterance)
}

override func viewDidLoad() {
    super.viewDidLoad()  //peter叫我加這個
    //view.backgroundColor = UIColor.white.withAlphaComponent(0.40)
    
    //CAEmitterLayer發射的粒子其實是 CAEmitterCell，so需要產生 CAEmitterCell物件
    //???let snowEmitterLayer = CAEmitterLayer()
    
    
    let snowEmitterCell = CAEmitterCell()
snowEmitterCell.contents = UIImage(named: "snow")?.cgImage
        
//透過scaleRang設定大小的範圍，0.5是一半的大小。設定0.06~0.3為一個range
snowEmitterCell.scale = 0.06
snowEmitterCell.scaleRange = 0.1
        
snowEmitterCell.scaleSpeed = -0.02//雪花大小改變的速度
snowEmitterCell.emissionRange = .pi
snowEmitterCell.lifetime = 20.0
//雪花維持的秒數，讓雪花只停留20秒
snowEmitterCell.birthRate = 8
//設定每秒發射幾個雪花，指定一秒2個
snowEmitterCell.velocity = -30  //雪花移動的速度
snowEmitterCell.velocityRange = -20
//利用yAcceleration 設定向下移動的加速度
snowEmitterCell.yAcceleration = 30
snowEmitterCell.xAcceleration = 5
//利用spin和spinRange 設定雪花轉速的範圍
snowEmitterCell.spin = 0.5
snowEmitterCell.spinRange = 1.0
    
//控制snow從哪裡發射（以下都不用再重覆寫，因為最後用[snowEmitterCell,sakuraEmitterCell] 可以寫在一起）
    //snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
    //snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
    //snowEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
    //snowEmitterLayer.beginTime = CACurrentMediaTime()
    //snowEmitterLayer.timeOffset = 10
    //view.layer.addSublayer(snowEmitterLayer)這行不寫，因為只要產生一個 CAEmitterLayer
    
    //以下4行，造成程式沒寫在 function 的 { } 裡
    // }
    //override func viewDidLoad() {
    //super.viewDidLoad()
    //view.backgroundColor = UIColor.white.withAlphaComponent(0.40)
        
//再來下櫻花
//let sakuraEmitterLayer = CAEmitterLayer()
let sakuraEmitterCell = CAEmitterCell()
   
sakuraEmitterCell.contents = UIImage(named: "sakura")?.cgImage
sakuraEmitterCell.scale = 0.06
sakuraEmitterCell.scaleRange = 0.1
sakuraEmitterCell.scaleSpeed = -0.02//改變的速度
sakuraEmitterCell.emissionRange = .pi
sakuraEmitterCell.lifetime = 10.0 //只停留10秒
sakuraEmitterCell.birthRate = 2 //指定一秒2個
sakuraEmitterCell.velocity = -30 //移動的速度
sakuraEmitterCell.velocityRange = -20
//利用yAcceleration 設定向下移動的加速度
sakuraEmitterCell.yAcceleration = 30
sakuraEmitterCell.xAcceleration = 5//設定轉速的範圍
sakuraEmitterCell.spin = 0.5
sakuraEmitterCell.spinRange = 1.0
//let sakuraEmitterLayer=CAEmitterLayer()  這行不寫，因為只要產生一個 CAEmitterLayer

//控制sakura從哪裡發射（以下都不用再重覆寫，因為最後用[snowEmitterCell,sakuraEmitterCell] 可以寫在一起）
    //sakuraEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
    //sakuraEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
    //sakuraEmitterLayer.emitterShape = //（這行不寫）CAEmitterLayerEmitterShape.line
    //sakuraEmitterLayer.beginTime = CACurrentMediaTime()
    //sakuraEmitterLayer.timeOffset = 10
    //view.layer.addSublayer(sakuraEmitterLayer) 這行不寫，因為只要產生一個 CAEmitterLayer


let snowEmitterLayer = CAEmitterLayer()
snowEmitterLayer.emitterCells = [snowEmitterCell,sakuraEmitterCell]
//控制從哪裡發射（用 [snowEmitterCell,sakuraEmitterCell] 把snow和sakura兩個元件依snow為首寫在一起）
snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
snowEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
snowEmitterLayer.beginTime = CACurrentMediaTime()
snowEmitterLayer.timeOffset = 10
view.layer.addSublayer(snowEmitterLayer)
    }
}

