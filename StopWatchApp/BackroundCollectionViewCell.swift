//
//  BackroundCollectionViewCell.swift
//  StopWatchApp
//
//  Created by mr Yacine on 12/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit

class BackroundCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var View: UIView!
    
    var gradientLayer : CAGradientLayer!
    
    func creatGradientLayer() {
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.contentView.bounds
        
        gradientLayer.colors = [ArrayColor[3].FirstColor.he().cgColor, ArrayColor[0].SecondColor.he().cgColor]
        self.View.layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.contentView.bounds
    }
    
    
    func update(Colors : ToHex){
        creatGradientLayer()
        gradientLayer.colors = [Colors.FirstColor.he().cgColor, Colors.SecondColor.he().cgColor]
    }
}
