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
    
    @IBOutlet weak var plantimg: UIImageView!
    @IBOutlet weak var yukarieatButton: UIButton!
    
    @IBAction func yukariEat(_ sender: Any) {
        //var flag = UserDefaults.standard.bool(forKey: "isWaterGiven")
        //var yukariEatingTime: Timer!
        
        var view = AnimationView()
        koalaEating(name: "eat_animation", view: view)
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) {_ in
            self.koalaEating(name: "koala-smiling", view: view)
            Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(self.plantVis), userInfo: nil, repeats: false)
        }
    }
    @objc func plantVis() {
        plantimg.isHidden = true
    }
    
//    @objc private func koalaStopEating(_ view: AnimationView){
//        view.stop()
//    }
    
    func koalaEating(name: String, view: AnimationView) -> AnimationView{
            if  let path: String = Bundle.main.path(forResource: name, ofType: "json")
            {
                        print(path)
                        view.animation = Animation.filepath(path)
                        view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                        view.center = self.view.center
                        view.loopMode = .loop
                        self.view.addSubview(view)
                        view.play()
                    }
        return view
    }
    
    private func loadDate(key: String) -> Date {
        let value = UserDefaults.standard.object(forKey: key)
        guard let date = value as? Date else {
            // default return
            return Date()
        }
        return date
    }
    
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
                //koalaImage.image = image
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

