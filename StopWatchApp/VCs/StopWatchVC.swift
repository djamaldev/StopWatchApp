//
//  StopWatchVC.swift
//  StopWatchApp
//
//  Created by mr Yacine on 07/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit

class StopWatchVC: XViewController {
    
    @IBOutlet weak var TimeLabel : UILabel!
    
    var seconds : Int = 0
    
    var IsRuning : Bool = false
    
    var xTimes : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = ArrayColor[0].FirstColor.Hexa()
    }
    
    @IBAction func Star (sender : UIButton) {
        
        IsRuning = !IsRuning
        
        if IsRuning {
            
            xTimes = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (Timer) in
                
                self.seconds = self.seconds + 1
                
                self.TimeLabel.text = self.GetTime()
                
                self.seconds = self.seconds + Int(result * 100)
                result = 0
            }
            
            sender.setTitle("Stop", for: .normal)
            
        }
        else {
            
         xTimes?.invalidate()
            
         sender.setTitle("Start", for: .normal)
            
        }
    }
    func GetTime() -> String {
        var hours : Int = 0
        
        var Minutes : Int = 0
        
        var sec : Int = 0
        
        var msec : Int = self.seconds
        
        sec = self.seconds / 100
        
        msec = self.seconds - (sec * 100)
        
        hours = sec / 3600
        
        sec = sec - (hours * 3600)
        
        Minutes = sec / 60
        
        sec = sec - (Minutes * 60)
        
        var strhours : String = String(hours)
        
        var strminute : String = String(Minutes)
        
        var strsec : String = String(sec)
        
        var strmsec : String = String(msec)
        
        if strhours.count == 1 {strhours = "0" + strhours  }
        
        if strminute.count == 1 {strminute = "0" + strminute  }
        
        if strsec.count == 1 {strsec = "0" + strsec  }
        
        if strmsec.count == 1 {strmsec = "0" + strmsec  }
        
        return "\(strhours) : \(strminute) : \(strsec) : \(strmsec)"
        
    }
}
class CirclButton: UIButton {
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}
