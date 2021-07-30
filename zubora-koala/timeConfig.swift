//
//  timeConfig.swift
//  zubora-koala
//
//  Created by Atsushi Muroi on 2021/07/30.
//

import UIKit
import SwiftUI

class timeConfigController: UIViewController {

    // timeConfig.storyboard
    @IBOutlet weak var fieldTimeConf: UITextField!
    var pickerToolBar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //datepicker上のtoolbarのdoneボタン
        pickerToolBar = UIToolbar()
        pickerToolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: "doneBtn")
        pickerToolBar.items = [toolBarBtn]
        fieldTimeConf.inputAccessoryView = pickerToolBar
        
    }
    
    
    @IBAction func textFieldEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.time
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), for: UIControl.Event.valueChanged)
            
    }
    
    //datepickerが選択されたらtextfieldに表示
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat  = "yyyy/MM/dd";
        birthday.text = dateFormatter.stringFromDate(sender.date)
    }
    
}
