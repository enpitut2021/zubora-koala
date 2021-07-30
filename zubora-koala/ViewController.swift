//
//  ViewController.swift
//  zubora-koala
//
//  Created by MacBook Pro on 2021/07/29.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let dt = Date()
    let dateFormatter = DateFormatter()

    dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))

    print(dateFormatter.string(from: dt))


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func clickButton(_ sender: Any) {
        let view = UIHostingController(rootView: ContentView())
        self.present(view, animated: true, completion: nil)
    }
}

