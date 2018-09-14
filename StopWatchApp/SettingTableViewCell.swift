//
//  SettingTableViewCell.swift
//  StopWatchApp
//
//  Created by mr Yacine on 09/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var label: LanguageLabel!

    func update(set : SettingObj) {
        imgView.image = set.Image
        label.ArabicText = set.ArabicName
        label.EnglishText = set.EnglishName
    }
}

class settingv : UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6
    }
}
