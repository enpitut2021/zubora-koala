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
        let toolBarBtn = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(doneBtn))
        pickerToolBar.items = [toolBarBtn]
        fieldTimeConf.inputAccessoryView = pickerToolBar
        
    }
    
    
    @IBAction func textFieldEditing(_ textField: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.time
        textField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
            
    }
    
    //datepickerが選択されたらtextfieldに表示
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "HH:mm";
        fieldTimeConf.text = dateFormatter.string(from: sender.date)
    }
    
    //toolbarのdoneボタン
    @objc func doneBtn(){
        fieldTimeConf.resignFirstResponder()
    }
}
