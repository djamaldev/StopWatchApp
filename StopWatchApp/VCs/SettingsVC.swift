//
//  SettingsVC.swift
//  StopWatchApp
//
//  Created by mr Yacine on 08/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit
import StoreKit
class SettingsVC : XViewController {
    
    var Array : [SettingObj] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        Array.append(SettingObj(EnglishName: "Backround", ArabicName: "خلفيات", Image: #imageLiteral(resourceName: "back"), Action: {
            self.performSegue(withIdentifier: "Backround", sender: nil)
            
        }))
        Array.append(SettingObj(EnglishName: "Langages", ArabicName: "اللغة", Image: #imageLiteral(resourceName: "lang"), Action: {
            self.performSegue(withIdentifier: "Langages", sender: nil)
        }))
        Array.append(SettingObj(EnglishName: "Twitter", ArabicName: "تويتر", Image: #imageLiteral(resourceName: "tt"), Action: {
            let TwitterUserName = "@NalticeD"
            let appURL = URL(string: "twitter://user?screen_name=\(TwitterUserName)")!
            let webURL = URL(string: "https://twitter.com/\(TwitterUserName)")!
            let application = UIApplication.shared
            if application.canOpenURL(appURL) {
                UIApplication.shared.open(appURL, options: [:] , completionHandler: nil)
            }
            else {
                UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
            }
        }))
        Array.append(SettingObj(EnglishName: "Email", ArabicName: "البريد", Image: #imageLiteral(resourceName: "em"), Action: {
            let appURL = URL(string: "mailto:\("seurdjimo@gmail.com")")!
            let application = UIApplication.shared
            if application.canOpenURL(appURL) {
                UIApplication.shared.open(appURL, options: [:] , completionHandler: nil)
            }
        }))
        Array.append(SettingObj(EnglishName: "Rate", ArabicName: "تقييم التطبيق", Image: #imageLiteral(resourceName: "rate"), Action: {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            } else {
                // Fallback on earlier versions
            }
        }))
        Array.append(SettingObj(EnglishName: "Call", ArabicName: "اتصال", Image: #imageLiteral(resourceName: "call"), Action: {
            let numberPhone = "+213796059151"
            let appURL = URL(string: "tel://\(numberPhone)")!
            let application = UIApplication.shared
            if application.canOpenURL(appURL) {
                UIApplication.shared.open(appURL, options: [:] , completionHandler: nil)
            }
        }))
        Array.append(SettingObj(EnglishName: "Share", ArabicName: "مشاركة التطبيق", Image: #imageLiteral(resourceName: "share"), Action: {
            let SharingApp = ["", #imageLiteral(resourceName: "rate")] as [Any]
            let Activity = UIActivityViewController(activityItems: SharingApp, applicationActivities: nil)
            Activity.popoverPresentationController?.sourceView = self.view
            self.present(Activity, animated: true, completion: nil)
        }))
    }
    
    @IBOutlet weak var table: UITableView! {
        didSet {
            table.delegate = self
            table.dataSource = self
        }
    }
    
}

extension SettingsVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = table.dequeueReusableCell(withIdentifier: "Cell") as! SettingTableViewCell
        cel.update(set: Array[indexPath.row])
        return cel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Array[indexPath.row].Action?()
    }
}
