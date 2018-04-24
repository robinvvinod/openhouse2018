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
    @IBOutlet var curriculum: CardHighlight!
    @IBOutlet var map: CardHighlight!
    
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
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Coming Next
        
        comingnext.backgroundImage = UIImage(named: "comingupnextBg")
        comingnext.title = "Coming up next"
        comingnext.itemTitle = "Activities that are starting soon:"
        comingnext.itemSubtitle = ""
        comingnext.textColor = UIColor.white
        
        comingnext.hasParallax = true
        
        let comingnextVC = storyboard!.instantiateViewController(withIdentifier: "comingnextVC")
        comingnext.shouldPresent(comingnextVC, from: self, fullscreen: true)
        
        // About SST
        
        aboutSST.textColor = UIColor.black
        aboutSST.videoSource = URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType:"mp4")!)
        aboutSST.shouldDisplayPlayer(from: self)
        
        aboutSST.playerCover = UIImage(named: "sstsketch")!
        aboutSST.playImage = UIImage(named: "CardPlayerPlayIcon")!
        
        aboutSST.isAutoplayEnabled = true
        aboutSST.shouldRestartVideoWhenPlaybackEnds = true
        
        aboutSST.title = "Our School"
        aboutSST.subtitle = "Tap to learn more about SST "
        aboutSST.category = "About SST"
        aboutSST.subtitleSize = 16
        aboutSST.hasParallax = true
        
        let aboutSSTVC = storyboard!.instantiateViewController(withIdentifier: "aboutSSTVC")
        aboutSST.shouldPresent(aboutSSTVC, from: self, fullscreen: true)
        
        // Curriculum
        
        curriculum.backgroundImage = UIImage(named: "currBg")
        curriculum.title = "Curriculum"
        curriculum.itemTitle = "View more about the SST Curriculum"
        curriculum.itemSubtitle = ""
        curriculum.textColor = UIColor.white
        
        curriculum.hasParallax = true
        
        let curriculumVC = storyboard!.instantiateViewController(withIdentifier: "curriculumVC")
        curriculum.shouldPresent(curriculumVC, from: self, fullscreen: true)
        
        // Map
        
        map.backgroundImage = UIImage(named: "mapBg")
        map.title = "Map"
        map.itemTitle = "Navigate around \nthe school"
        map.itemSubtitle = ""
        map.textColor = UIColor.white
        
        map.hasParallax = true
        
        let mapVC = storyboard!.instantiateViewController(withIdentifier: "mapVC")
        map.shouldPresent(mapVC, from: self, fullscreen: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let gradient = CAGradientLayer()
        
        gradient.frame = gradientView.bounds
        gradient.colors = [UIColor(red: 236/255, green: 247/255, blue: 231/255, alpha: 1).cgColor, UIColor(red: 208/255, green: 156/255, blue: 215/255, alpha: 1).cgColor]
        
        gradientView.layer.insertSublayer(gradient, at: 0)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


