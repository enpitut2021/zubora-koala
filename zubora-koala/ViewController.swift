//
//  ViewController.swift
//  zubora-koala
//
//  Created by MacBook Pro on 2021/07/29.
//

import UIKit
import SwiftUI
import Lottie

class ViewController: UIViewController {
    var image: UIImage!
    var viewMain: AnimationView = AnimationView()
    
    @IBOutlet weak var plantimg: UIImageView!
    @IBOutlet weak var yukarieatButton: UIButton!
    
    @IBAction func yukariEat(_ sender: Any) {
        koalaEating(name: "eat_animation", view: self.viewMain)
        yukarieatButton.isEnabled = false
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) {_ in
        }
    }
    
    func koalaEating(name: String, view: AnimationView) -> AnimationView{
        if  let path: String = Bundle.main.path(forResource: name, ofType: "json") {
            //print(path)
            view.animation = Animation.filepath(path)
            view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            view.center = self.view.center
            view.loopMode = .loop
            self.view.addSubview(view)
            view.play()
        }
        return view
    }
    
    var timerMain: Timer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // timerTest() を5秒おきに呼び出す登録
        self.timerMain = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerMainView(view:)), userInfo: nil, repeats: true)
    }

    
    @objc func timerMainView(view: AnimationView) {
        
        let flag = UserDefaults.standard.bool(forKey: "isWaterGiven")
        
        let now = Date()
        let start = loadDate(key: "start_time")
        let end = Date(timeInterval: 60*30, since: start)
        
        // 時間範囲指定
        if start <= now && now <= end {
            // print("範囲内です")
            yukarieatButton.isHidden = false
            plantimg.isHidden = false
        } else {
            // print("範囲外です")
            yukarieatButton.isHidden = true
            plantimg.isHidden = true
            if !flag {
                image = UIImage(named: "angry")
                //koalaImage.image = image
            }
        }
        
        
        // この処理の目的しりたい
        if flag == true {

            yukarieatButton.isHidden = true
            plantimg.isHidden = true

            if  let path: String = Bundle.main.path(forResource: "koala-smiling", ofType: "json") {
                //print(path)
                self.viewMain.animation = Animation.filepath(path)
                self.viewMain.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                self.viewMain.center = self.view.center
                self.viewMain.loopMode = .loop
                self.view.addSubview(self.viewMain)
                self.viewMain.play()
            }
        } else {
            if now <= end {
                // print("範囲内です")
                
                if  let path: String = Bundle.main.path(forResource: "51431-koala-wink", ofType: "json") {
                    //print(path)
                    self.viewMain.animation = Animation.filepath(path)
                    self.viewMain.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                    self.viewMain.center = self.view.center
                    self.viewMain.loopMode = .loop
                    self.view.addSubview(self.viewMain)
                    self.viewMain.play()
                }
                if start <= now {
                    yukarieatButton.isHidden = false
                    plantimg.isHidden = false
                } else {
                    yukarieatButton.isHidden = true
                    plantimg.isHidden = true
                }
            } else {
                // print("範囲外です")
                yukarieatButton.isHidden = true
                plantimg.isHidden = true
                // 悲しい顔に変更する
                if  let path: String = Bundle.main.path(forResource: "koala-smiling", ofType: "json") {
                    //print(path)
                    self.viewMain.animation = Animation.filepath(path)
                    self.viewMain.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                    self.viewMain.center = self.view.center
                    self.viewMain.loopMode = .loop
                    self.view.addSubview(self.viewMain)
                    self.viewMain.play()
                }
            }
        }
    }

}

