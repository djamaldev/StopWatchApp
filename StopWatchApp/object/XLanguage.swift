//
//  XLanguage.swift
//  StopWatchApp
//
//  Created by mr Yacine on 12/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit

class XLanguage  {
    
    enum LanguageEnum : String {
        
        case Arabic
        case English
        
        }
    
    static func set(Language : LanguageEnum){
        UserDefaults.standard.set(Language.rawValue, forKey: "Lang")
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("LanguageChanged"), object: nil)
    }
    
    static func Get() -> LanguageEnum {
        
        if let lan = UserDefaults.standard.value(forKey: "Lang") as? String {
            
            if lan == "Arabic" {
                return .Arabic
            }
            else if lan == "English" {
                return .English
            }
        }
        return .English
    }
    
}

class LanguageButton : UIButton {
    
    @IBInspectable var ArabicText : String = "" {
        didSet {
            update()
        }
    }
    
    @IBInspectable var EnglishText : String = "" {
        
        didSet {
            update()
        }
    }
    
    @objc func update() {
        if XLanguage.Get() == .Arabic {
            self.setTitle(self.ArabicText, for: .normal)
        }
        else if XLanguage.Get() == .English {
            self.setTitle(self.EnglishText, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(LanguageButton.update), name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
    }
}

class LanguageLabel : UILabel {
    
    @IBInspectable var ArabicText : String = "" {
        didSet {
            update()
        }
    }
    
    @IBInspectable var EnglishText : String = "" {
        
        didSet {
            update()
        }
    }
    
    @objc func update() {
        if XLanguage.Get() == .Arabic {
            self.text = ArabicText
        }
        else if XLanguage.Get() == .English {
            self.text = EnglishText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nc1 = NotificationCenter.default
        nc1.addObserver(self, selector: #selector(LanguageLabel.update), name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
    }
    
}

class LaguageItem : UINavigationItem {
    @IBInspectable var ArabicText : String = "" {
        didSet {
            update()
        }
    }
    
    @IBInspectable var EnglishText : String = "" {
        
        didSet {
            update()
        }
    }
    
    @objc func update() {
        if XLanguage.Get() == .Arabic {
            self.title = ArabicText
        }
        else if XLanguage.Get() == .English {
            self.title = EnglishText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nc1 = NotificationCenter.default
        nc1.addObserver(self, selector: #selector(LaguageItem.update), name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
    }
    
    
}

