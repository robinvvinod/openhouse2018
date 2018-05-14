//
//  MainViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 9/1/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit
import Cards
import SwiftMessages

class MainViewController: UIViewController {
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet var comingnext: CardHighlight!
    @IBOutlet var aboutSST: CardPlayer!
    @IBOutlet var schedule: CardHighlight!
    @IBOutlet var map: CardHighlight!
    @IBOutlet var booths: CardHighlight!
    @IBOutlet var redemption: CardHighlight!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display instructions if first launch
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if !launchedBefore {
            
            let instructionView = MessageView.viewFromNib(layout: .centeredView)
            SwiftMessages.defaultConfig.presentationStyle = .center
            SwiftMessages.defaultConfig.duration = .seconds(seconds: 10)
            instructionView.configureTheme(.success)
            instructionView.configureDropShadow()
            instructionView.configureContent(title: "Welcome to SST!", body: "If you are having any problems using the app, please approach one of the Student Councillors for help.")
            instructionView.button?.isHidden = true
            SwiftMessages.show(view: instructionView)
            SwiftMessages.pauseBetweenMessages = 1.0
            
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
        
        // Check for internet access
    
        if Reachability.isConnectedToNetwork() == false {
            NSLog("No internet")
            SwiftMessages.defaultConfig.presentationStyle = .top
            SwiftMessages.defaultConfig.duration = .seconds(seconds: 10)
            let internetAlert = MessageView.viewFromNib(layout: .cardView)
            internetAlert.configureTheme(.error)
            internetAlert.configureDropShadow()
            internetAlert.button?.isHidden = true
            internetAlert.configureContent(title: "No Internet", body: "Some of the features may not work without an internet connection")
            SwiftMessages.show(view: internetAlert)
            
        }
        
        // About SST
        
        aboutSST.textColor = UIColor.black
        aboutSST.videoSource = URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType:"mp4")!)
        aboutSST.shouldDisplayPlayer(from: self)
        
        aboutSST.playerCover = UIImage(named: "sstsketch")!
        aboutSST.playImage = UIImage(named: "CardPlayerPlayIcon")!
        
        aboutSST.isAutoplayEnabled = true
        aboutSST.shouldRestartVideoWhenPlaybackEnds = true
        
        aboutSST.title = "Our School"
        aboutSST.titleSize = 22
        aboutSST.subtitle = "Learn more about SST "
        aboutSST.category = "About SST"
        aboutSST.subtitleSize = 16
        aboutSST.hasParallax = false
        
        let aboutSSTVC = storyboard!.instantiateViewController(withIdentifier: "aboutSSTVC")
        aboutSST.shouldPresent(aboutSSTVC, from: self, fullscreen: true)
        
        // Coming Next
        
        comingnext.backgroundImage = UIImage(named: "comingupnextBg")
        comingnext.title = "Coming up next"
        comingnext.itemTitle = "Activities that are starting soon:"
        comingnext.itemSubtitle = ""
        comingnext.textColor = UIColor.white
        
        comingnext.hasParallax = false
        
        let comingnextVC = storyboard!.instantiateViewController(withIdentifier: "comingnextVC")
        comingnext.shouldPresent(comingnextVC, from: self, fullscreen: true)
        
        // Schedule
        
        schedule.backgroundImage = UIImage(named: "mapBg")
        schedule.title = "Activites"
        schedule.itemTitle = "See the activities \n going on"
        schedule.itemSubtitle = ""
        schedule.textColor = UIColor.white
        
        schedule.hasParallax = false
        
        let scheduleVC = storyboard!.instantiateViewController(withIdentifier: "scheduleVC")
        schedule.shouldPresent(scheduleVC, from: self, fullscreen: true)
        
        // Map
        
        map.backgroundImage = UIImage(named: "mapBg")
        map.title = "Map"
        map.itemTitle = "Navigate around \nthe school"
        map.itemSubtitle = ""
        map.textColor = UIColor.white
        
        map.hasParallax = false
        
        let mapVC = storyboard!.instantiateViewController(withIdentifier: "mapVC")
        map.shouldPresent(mapVC, from: self, fullscreen: true)
        
        // Booths
        
        booths.backgroundImage = UIImage(named: "mapBg")
        booths.title = "Booths"
        booths.itemTitle = "Check out the booths\naround the school"
        booths.itemSubtitle = ""
        booths.textColor = UIColor.white
        
        booths.hasParallax = false
        
        let boothsVC = storyboard!.instantiateViewController(withIdentifier: "boothsVC")
        booths.shouldPresent(boothsVC, from: self, fullscreen: true)
        
        // Redemption
        
        redemption.backgroundImage = UIImage(named: "mapBg")
        redemption.title = "Redemption"
        redemption.itemTitle = "Collect codes at booths\nto win attractive prizes!"
        redemption.itemSubtitle = ""
        redemption.textColor = UIColor.white
        
        redemption.hasParallax = false
        
        let redemptionVC = storyboard!.instantiateViewController(withIdentifier: "redemptionVC")
        redemption.shouldPresent(redemptionVC, from: self, fullscreen: true)
        
    }
        
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


