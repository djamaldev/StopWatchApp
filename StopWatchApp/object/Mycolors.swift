//
//  Mycolors.swift
//  StopWatchApp
//
//  Created by mr Yacine on 11/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit

private class Mycolors {
    
    static func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
extension String {
    func he() -> UIColor {
        return Mycolors.hexStringToUIColor(hex: self)
    }
}


class ToHex {
    
    
    var FirstColor : String
    var SecondColor : String
    
    init(FirstColor : String, SecondColor : String) {
        self.FirstColor = FirstColor
        self.SecondColor = SecondColor
    }
}

var ArrayColor : [ToHex] = [
     ToHex(FirstColor: "14007b", SecondColor: "2b007b"),
     ToHex(FirstColor: "f5e44c", SecondColor: "f787ff"),
     ToHex(FirstColor: "2b000c", SecondColor: "2b001c"),
     ToHex(FirstColor: "00bfff", SecondColor: "0040ff"),
     ToHex(FirstColor: "bf00ff", SecondColor: "ff00ff"),
     ToHex(FirstColor: "ff00bf", SecondColor: "ff0080"),
     ToHex(FirstColor: "ff0040", SecondColor: "ff0000"),
     ToHex(FirstColor: "80ff00", SecondColor: "40ff00"),
    ToHex(FirstColor: "00ffbf", SecondColor: "00ffff"),
    ToHex(FirstColor: "ff0055", SecondColor: "ff007b")]
