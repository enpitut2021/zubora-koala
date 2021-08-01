//
//  animation.swift
//  zubora-koala
//
//  Created by MacBook Pro on 2021/08/01.
//

import SwiftUI
import UIKit
import Lottie

class animation: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = AnimationView()
        if  let path: String = Bundle.main.path(forResource: "koala-smiling", ofType: "json") {
            print(path)
            view.animation = Animation.filepath(path)
            view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            view.center = self.view.center
            view.loopMode = .loop
            self.view.addSubview(view)
            view.play()
        } else {
          print("ないぞ")
        }
    }
}
