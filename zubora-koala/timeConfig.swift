//
//  timeConfig.swift
//  zubora-koala
//
//  Created by Atsushi Muroi on 2021/07/30.
//

import UIKit
import SwiftUI


class timeConfigController: UIViewController {
    @IBOutlet var button_done: UIView!
    
    // PickerOnly
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pickerConf: UIDatePicker!
    @IBAction func pickerChanged(_ sender: Any) {

    }
      
    @IBAction func resetButton(_ sender: Any) {
            UserDefaults.standard.set(false, forKey: "isYukariGiven")
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        1スタートタイムの値を初期値にする
        let start_time = loadDate(key: "start_time")
//        2それをpcdに入れる
        pickerConf.date = start_time
        
    }
    
    @IBAction func clicked_button(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
//        UserDefaults.standard.set(formatter.string(from: pickerConf.date), forKey: "start_time")
        UserDefaults.standard.set(pickerConf.date, forKey: "start_time")
        let parentViewCon = self.presentingViewController as! ViewController
        parentViewCon.timerMainView()
        self.dismiss(animated: true, completion: nil)
    }
    
}
