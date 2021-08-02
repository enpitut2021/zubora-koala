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
        // Do any additional setup after loading the view.
        let dt = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))

        //print(dateFormatter.string(from: dt))
        //print(dt)
        
        
        let flag = UserDefaults.standard.bool(forKey: "isWaterGiven")

        let time1 = "\(dateFormatter.string(from: dt))"
        print(time1)
        //let start = "\(UserDefaults.standard.string(forKey: "start_time") ?? "01:00:00")"
        let start = "08:45:00"
        print(start)
        let end = "23:59:00"
        print(end)
        
        if flag == true{
        let view = AnimationView()
                if  let path: String = Bundle.main.path(forResource: "koala-smiling", ofType: "json")
                {
                            print(path)
                            view.animation = Animation.filepath(path)
                            view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                            view.center = self.view.center
                            view.loopMode = .loop
                            self.view.addSubview(view)
                            view.play()
                        }
        }else{
            let view = AnimationView()
                    if  let path: String = Bundle.main.path(forResource: "51431-koala-wink", ofType: "json")
                    {
                                print(path)
                                view.animation = Animation.filepath(path)
                                view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                                view.center = self.view.center
                                view.loopMode = .loop
                                self.view.addSubview(view)
                                view.play()
                    }
        }
        

        if start <= time1 && time1 <= end {
            print("範囲内です")
            buttonTimeToGive.isHidden = false
        } else {
            print("範囲外です")
            buttonTimeToGive.isHidden = false
           
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

