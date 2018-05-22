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

class RedemptionViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var ref: DatabaseReference!
    var codes = [String]()
    var claimed = [String]()
    var enteredCode = ""
    var numberClaimed = 0
    @IBOutlet var cylinderImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberClaimed = UserDefaults.standard.integer(forKey: "codes")
        cylinderImage.image = UIImage(named: "code\(self.numberClaimed)")
        
        let tapRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.tappedImage(_:)))
        tapRecognizer.delegate = self
        self.cylinderImage.addGestureRecognizer(tapRecognizer)
        self.cylinderImage.isUserInteractionEnabled = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
    
    @objc func tappedImage(_ sender: AnyObject) {
        
        SwiftMessages.defaultConfig.presentationStyle = .center
        SwiftMessages.defaultConfig.duration = .seconds(seconds: 5)
        let slInfo = MessageView.viewFromNib(layout: .centeredView)
        slInfo.configureTheme(.warning)
        slInfo.configureDropShadow()
        slInfo.button?.setTitle("Mark as redeemed", for: .normal)
        
        slInfo.buttonTapHandler = {
            _ in
            SwiftMessages.hide()
            
            // Ask for SL password
            
            let alert = UIAlertController(title: "Confirmation", message: "Enter the Confirmation Code (SLs)", preferredStyle: .alert)
            
            alert.addTextField { (textField) in
                textField.text = ""
                textField.keyboardType = UIKeyboardType.numberPad
            }
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak alert] (_) in
                
                // Checking code entered
                
                if alert?.textFields![0].text == "1932" {
                    UserDefaults.standard.set(true, forKey: "redeemed")
                }
                
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        slInfo.configureContent(title: "Information for SLs", body: "DSA registration done? :   \(UserDefaults.standard.bool(forKey: "dsadone"))\nRedeemed Before? :    \(UserDefaults.standard.bool(forKey: "redeemed"))\n")
        SwiftMessages.show(view: slInfo)
    }

    @IBAction func redeem(_ sender: Any) {
        
        let alert = UIAlertController(title: "Redeem", message: "Enter the 4 Digit Booth Code", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
			textField.autocapitalizationType = .allCharacters
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Redeem", style: .default, handler: { [weak alert] (_) in
            
            // Initialising entered data on textfield
            
            if alert?.textFields![0].text != nil {
                self.enteredCode = (alert?.textFields![0].text)!
            } else {self.enteredCode = "NIL"}
            
            if self.enteredCode == "JQWN" { // Checking if DSA registration was done
                UserDefaults.standard.set(true, forKey: "dsadone")
            }
            
            // Retrieving claimed list from UserDefaults
            
            self.claimed = UserDefaults.standard.stringArray(forKey: "claimed") ?? [String]()
            
            // Booth code has been claimed before
            
            if self.claimed.contains(self.enteredCode) {
                
                SwiftMessages.defaultConfig.presentationStyle = .top
                SwiftMessages.defaultConfig.duration = .seconds(seconds: 5)
                let claimedError = MessageView.viewFromNib(layout: .cardView)
                claimedError.configureTheme(.error)
                claimedError.configureDropShadow()
                claimedError.button?.isHidden = true
                claimedError.configureContent(title: "Invalid Code", body: "The code you have entered has been claimed before.")
                SwiftMessages.show(view: claimedError)
                
            }
                
            // Booth code is invalid
                
            else if !(self.codes.contains(self.enteredCode)) {
                
                SwiftMessages.defaultConfig.presentationStyle = .top
                SwiftMessages.defaultConfig.duration = .seconds(seconds: 5)
                let invalidError = MessageView.viewFromNib(layout: .cardView)
                invalidError.configureTheme(.error)
                invalidError.configureDropShadow()
                invalidError.button?.isHidden = true
                invalidError.configureContent(title: "Invalid Code", body: "The code you have entered is invalid.")
                SwiftMessages.show(view: invalidError)
            }
            
            // Booth code is valid
                
            else {
                self.numberClaimed += 1
                
                if self.numberClaimed <= 10 {
                    self.cylinderImage.image = UIImage(named: "code\(self.numberClaimed)")
                    UserDefaults.standard.set(self.numberClaimed, forKey: "codes")
                    self.claimed.append(self.enteredCode)
                    UserDefaults.standard.set(self.claimed, forKey: "claimed")
                }
                else {
                    SwiftMessages.defaultConfig.presentationStyle = .top
                    SwiftMessages.defaultConfig.duration = .seconds(seconds: 5)
                    let exceedError = MessageView.viewFromNib(layout: .cardView)
                    exceedError.configureTheme(.error)
                    exceedError.configureDropShadow()
                    exceedError.button?.isHidden = true
                    exceedError.configureContent(title: "Alert", body: "We’re glad you’re enjoying the Open House but you can’t redeem more than 10 codes")
                    SwiftMessages.show(view: exceedError)
                }
            }
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func prizeList(_ sender: Any) {
        SwiftMessages.defaultConfig.presentationStyle = .center
        SwiftMessages.defaultConfig.duration = .seconds(seconds: 10)
        let internetAlert = MessageView.viewFromNib(layout: .centeredView)
        internetAlert.configureTheme(.info)
        internetAlert.configureDropShadow()
        internetAlert.button?.isHidden = true
        internetAlert.configureContent(title: "Prize List", body: "1 - 3 codes - Tier 1 Prize\n4 - 7 codes - Tier 2 Prize\n8 - 10 codes - Tier 3 Prize")
        SwiftMessages.show(view: internetAlert)
    }
    
}
