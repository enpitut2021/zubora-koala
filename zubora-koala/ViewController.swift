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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        5秒おきにタイマーテストをします
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerTest), userInfo: nil, repeats: true)
        
        let now = Date()
        let dateFormatter = DateFormatter()
        

        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))
        
        let flag = UserDefaults.standard.bool(forKey: "isWaterGiven")
        
        let start = loadDate(key: "start_time")
        print(start)
        let end: Date = Date(timeInterval: 60*30, since: start)
        print(end)
        
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
        

//        時間範囲指定
        if start <= now && now <= end {
            print("範囲内です")
            buttonTimeToGive.isHidden = false
        } else {
            print("範囲外です")
            buttonTimeToGive.isHidden = true
            if !flag {
                image = UIImage(named: "angry")
                koalaImage.image = image
            }
        }
        
    }

    @IBAction func clickButton(_ sender: Any) {
        let view = UIHostingController(rootView: ContentView())
        self.present(view, animated: true, completion: nil)
    }
    
    
    @objc func timerTest() {
        print("test")
    }


}

//タイマーテスト


class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @objc func timerUpdate() {
        print("update")
    }
}
