//
//  XViewContoller.swift
//  StopWatchApp
//
//  Created by mr Yacine on 11/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import Foundation
import UIKit

class XViewController : UIViewController {
    
    var gradientLayer : CAGradientLayer!
    
    func creatGradientLayer() {
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.zPosition = -1
        //gradientLayer.colors = [ArrayColor[3].FirstColor.he().cgColor, ArrayColor[0].SecondColor.he().cgColor]
        gradientLayer.colors = [BackroundColorManager.BGColors.FirstColor.he().cgColor, BackroundColorManager.BGColors.SecondColor.he().cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }
    
    
    @objc func updateColors (){
        gradientLayer.colors = [BackroundColorManager.BGColors.FirstColor.he().cgColor, BackroundColorManager.BGColors.SecondColor.he().cgColor]
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatGradientLayer()
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(XViewController.updateColors), name: NSNotification.Name(rawValue: "ChangedColors"), object: nil)
      }
}

extension UIView {
    
    @IBInspectable var CornerRadius : CGFloat {
        get { return layer.cornerRadius }
        set {  return layer.cornerRadius = newValue }
    }
    
    @IBInspectable var BorderWith : CGFloat {
        get { return layer.borderWidth }
        set {  return layer.borderWidth = newValue }
    }
    
    @IBInspectable var BorderColor : UIColor {
        get { return UIColor(cgColor: layer.borderColor!) }
        set {  return layer.borderColor = newValue.cgColor }
    }
}
