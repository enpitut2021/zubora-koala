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
    
    @IBOutlet weak var buttonTimeToGive: UIButton!
    @IBOutlet weak var koalaImage: UIImageView!
    var image: UIImage!
    
    @IBOutlet weak var yukarieatButton: UIButton!
    
    @IBAction func yukariEat(_ sender: Any) {
        //var flag = UserDefaults.standard.bool(forKey: "isWaterGiven")
        //var yukariEatingTime: Timer!
        
        let view = koalaEating(name: "eat_animation")
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) {_ in
            self.koalaEating(name: "koala-smiling")
        }
        //flag = true
    }
    
//    @objc private func koalaStopEating(_ view: AnimationView){
//        view.stop()
//    }
    
    func koalaEating(name: String) -> AnimationView{
        let view = AnimationView()
            if  let path: String = Bundle.main.path(forResource: name, ofType: "json")
            {
                        print(path)
                        view.animation = Animation.filepath(path)
                        view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
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
        self.timerMain = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerMainView), userInfo: nil, repeats: true)
        

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))
        
        // この処理の目的しりたい
        let flag = UserDefaults.standard.bool(forKey: "isWaterGiven")
        if flag == true {
            let view = AnimationView()
            if  let path: String = Bundle.main.path(forResource: "koala-smiling", ofType: "json") {
                print(path)
                view.animation = Animation.filepath(path)
                view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                view.center = self.view.center
                view.loopMode = .loop
                self.view.addSubview(view)
                view.play()
            }
        } else {
            let view = AnimationView()
            if  let path: String = Bundle.main.path(forResource: "51431-koala-wink", ofType: "json") {
                print(path)
                view.animation = Animation.filepath(path)
                view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                view.center = self.view.center
                view.loopMode = .loop
                self.view.addSubview(view)
                view.play()
            }
        }
    }

    @IBAction func clickButton(_ sender: Any) {
        let view = UIHostingController(rootView: ContentView())
        self.present(view, animated: true, completion: nil)
    }
    
    @objc func timerMainView() {
        
        let flag = UserDefaults.standard.bool(forKey: "isWaterGiven")
        
        let now = Date()
        let start = loadDate(key: "start_time")
        let end = Date(timeInterval: 60*30, since: start)
        
        // 時間範囲指定
        if start <= now && now <= end {
            // print("範囲内です")
            buttonTimeToGive.isHidden = false
        } else {
            // print("範囲外です")
            buttonTimeToGive.isHidden = true
            if !flag {
                image = UIImage(named: "angry")
                koalaImage.image = image
            }
        }
        // print("test")
    }

}

