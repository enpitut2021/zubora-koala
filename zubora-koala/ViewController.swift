//
//  ViewController.swift
//  zubora-koala
//
//  Created by MacBook Pro on 2021/07/29.
//

import UIKit
import SwiftUI
import Lottie


//
// ** usage **
// var viewABC = AnimationControl()  // 初期化
// viewABC.path = "filename"  // ファイル名変更
// viewABC.set(view: view)  // ViewControllerのviewを渡して再生
//
class AnimationControl {
    let sub: AnimationView
    var path: String?
    var pathPrev: String?
    var size: Int
    
    init() {
        sub = AnimationView()
        size = 300
    }
    
    func set (view: UIView) {
        let p: String? = Bundle.main.path (forResource: path, ofType: "json")
        if p != nil {
            sub.animation = Animation.filepath(p!)
            sub.frame = CGRect(x: 0, y: 0, width: size, height: size)
            sub.center = view.center
            sub.loopMode = .loop
        } else {
            print("not found")
        }
        
//        if path != pathPrev {
            pathPrev = path
            play(view: view)
//        }
        
//        print(path)
//        print(pathPrev)
    }
    
    func play(view: UIView) {
        view.addSubview(self.sub)
        self.sub.play()
    }
}


class ViewController: UIViewController {
    var image: UIImage!
    var viewSub = AnimationControl()
    var timerMain: Timer?
    
    @IBOutlet weak var plantimg: UIImageView!
    @IBOutlet weak var yukarieatButton: UIButton!
    
    @IBAction func yukariEat(_ sender: Any) {
        viewSub.path = "eat_animation"
        viewSub.set(view: view)
        yukarieatButton.isEnabled = false
        UserDefaults.standard.set(true, forKey: "isYukariGiven")
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) {_ in
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timerMainView()
        // timerTest() を5秒おきに呼び出す登録
        self.timerMain = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerMainView), userInfo: nil, repeats: true)
    }

    
    @objc func timerMainView() {
        
        let now = Date()
        let start = loadDate(key: "start_time")
        let end = Date(timeInterval: 60*10, since: start)
        let after12h = Date(timeInterval: 60*60*12, since: start)
        print(now)
        print(start)
//        print(isYukariGiven)
        if now >= after12h {
            // その日にする
            let nextstart = Date(timeInterval: 60*60*24, since: start)
            UserDefaults.standard.set(false, forKey: "isYukariGiven")
            UserDefaults.standard.set(nextstart, forKey: "start_time")
//            self.timerMainView()
        }
        let isYukariGiven = UserDefaults.standard.bool(forKey: "isYukariGiven")
        if isYukariGiven == true {

            yukarieatButton.isHidden = true
            plantimg.isHidden = true
            
            viewSub.path = "koala-smiling"
            viewSub.set(view: view)

        } else {
            if now <= end {
                // print("範囲内です")
                viewSub.path = "51431-koala-wink"
                viewSub.set(view: view)
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
                viewSub.path = "sad_koala"
                viewSub.set(view: view)
            }
        }
    }

}

