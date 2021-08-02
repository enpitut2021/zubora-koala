//
//  ViewController.swift
//  zubora-koala
//
//  Created by MacBook Pro on 2021/07/29.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonTimeToGive: UIButton!
    @IBOutlet weak var koalaImage: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dt = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))

        //print(dateFormatter.string(from: dt))
        //print(dt)
        
//        let time1 = "\(dateFormatter.string(from: dt))"
//        print(time1)
        
        
//        let start = "\(UserDefaults.standard.string(forKey: "start_time") ?? "01:00:00")"
        
//        参照
//        let today : Date = Date()
//        let yesterday: Date = Date(timeIntervalSinceNow:-60*60*24)
//
//        if today.compare(yesterday) == ComparisonResult.orderedDescending {
//           print("今日は昨日よりも未来")  // 実行される
//        }
        
        let start: Date = Date(timeIntervalSinceNow:-60*60)
        print(start)
        
        let end: Date = Date(timeIntervalSinceNow:+60*60)
        print(end)

//        時間範囲指定
        if start <= dt && dt <= end {
            print("範囲内です")
            buttonTimeToGive.isHidden = false
        } else {
            print("範囲外です")
            buttonTimeToGive.isHidden = true
            let flag = UserDefaults.standard.bool(forKey: "isWaterGiven")
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



}

