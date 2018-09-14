//
//  LanguageVC.swift
//  StopWatchApp
//
//  Created by mr Yacine on 12/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit

class LanguageVC : XViewController {
    
    @IBAction func ArabicLang(_ sender: LanguageButton) {
        XLanguage.set(Language: .Arabic)
    }
    
    @IBAction func EnglishLang(_ sender: LanguageButton) {
        XLanguage.set(Language: .English)
    }
    
}
