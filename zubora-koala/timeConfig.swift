//
//  timeConfig.swift
//  zubora-koala
//
//  Created by Atsushi Muroi on 2021/07/30.
//

import UIKit
import SwiftUI

class timeConfigController: UIViewController {
    
    // PickerOnly
    @IBOutlet weak var pickerConf: UIDatePicker!
    @IBAction func pickerChanged(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        print(formatter.string(from: pickerConf.date))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
