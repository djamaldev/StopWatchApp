//
//  BackroundColorManager.swift
//  StopWatchApp
//
//  Created by mr Yacine on 12/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit

class BackroundColorManager {
    
    static var BGColors : ToHex!
    
    
    static func Configure(){
        if let firstcolor = UserDefaults.standard.value(forKey: "FirstColor") as? String , let secondcolor = UserDefaults.standard.value(forKey: "SecondColor") as? String {
            BGColors = ToHex(FirstColor: firstcolor, SecondColor: secondcolor)
        }
        else {
            BGColors = ToHex(FirstColor: "f5e44c", SecondColor: "f787ff")
        }
    }
    
    static func ChangeTo(_ Color : ToHex) {
        BGColors = Color
        UserDefaults.standard.set(Color.FirstColor, forKey: "FirstColor")
        UserDefaults.standard.set(Color.SecondColor, forKey: "SecondColor")
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("ChangedColors"), object: nil)
        
 }
    
    
    
    
    
}
