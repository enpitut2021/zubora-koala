//
//  defaults.swift
//  zubora-koala
//
//  Created by Atsushi Muroi on 2021/08/02.
//

import Foundation


func loadDate(key: String) -> Date {
    let value = UserDefaults.standard.object(forKey: key)
    guard let date = value as? Date else {
        // default return
        return Date()
    }
    return date
}
