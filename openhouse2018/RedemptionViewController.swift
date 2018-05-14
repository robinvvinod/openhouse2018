//
//  RedemptionViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 14/5/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit
import Firebase
import SwiftMessages

class RedemptionViewController: UIViewController {
    
    var ref: DatabaseReference!
    var codes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check for internet access
        
        if Reachability.isConnectedToNetwork() == false {
            NSLog("No internet")
            SwiftMessages.defaultConfig.presentationStyle = .top
            SwiftMessages.defaultConfig.duration = .seconds(seconds: 10)
            let internetAlert = MessageView.viewFromNib(layout: .cardView)
            internetAlert.configureTheme(.error)
            internetAlert.configureDropShadow()
            internetAlert.button?.isHidden = true
            internetAlert.configureContent(title: "No Internet", body: "Redemption will not work without an internet connection.")
            SwiftMessages.show(view: internetAlert)
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ref = Database.database().reference()
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let value = snap.value as! [String:Any]
                let code = value["Code"] as! String
                self.codes.append(code)
                
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
