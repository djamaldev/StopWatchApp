//
//  SettingObj.swift
//  StopWatchApp
//
//  Created by mr Yacine on 10/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit

class SettingObj {
    
    var Image : UIImage
    var EnglishName : String
    var ArabicName : String
    var Action : (()->())?
    init(EnglishName : String, ArabicName : String, Image : UIImage, Action :@escaping ()->()) {
        
        self.EnglishName = EnglishName
        self.ArabicName = ArabicName
        self.Image = Image
        self.Action = Action
    }
    
}
