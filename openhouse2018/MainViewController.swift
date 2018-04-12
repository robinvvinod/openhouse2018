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
        
        // Coming Next
        
        comingnext.backgroundColor = UIColor(red: 127/255, green: 219/255, blue: 255/255, alpha: 1)
        comingnext.icon = UIImage(named: "ssticon")
        comingnext.title = "Coming up\nnext"
        comingnext.itemTitle = "Activities that are starting soon:"
        comingnext.itemSubtitle = "Tap the card to enlarge"
        comingnext.textColor = UIColor.white
        
        comingnext.hasParallax = true
        
        let comingnextVC = storyboard!.instantiateViewController(withIdentifier: "comingnextVC")
        comingnext.shouldPresent(comingnextVC, from: self, fullscreen: false)
        
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
        aboutSST.shouldPresent(aboutSSTVC, from: self, fullscreen: false)
        
        // Curriculum
        
        curriculum.backgroundColor = UIColor(red: 127/255, green: 219/255, blue: 255/255, alpha: 1)
        curriculum.icon = UIImage(named: "ssticon")
        curriculum.title = "Curriculum"
        curriculum.itemTitle = "Starting soon:"
        curriculum.itemSubtitle = "Tap the card to enlarge"
        curriculum.textColor = UIColor.white
        
        curriculum.hasParallax = true
        
        let curriculumVC = storyboard!.instantiateViewController(withIdentifier: "curriculumVC")
        curriculum.shouldPresent(curriculumVC, from: self, fullscreen: false)
        
        /*
        let instructionView = MessageView.viewFromNib(layout: .cardView)
        SwiftMessages.defaultConfig.presentationStyle = .top
        SwiftMessages.defaultConfig.duration = .seconds(seconds: 10)
        instructionView.configureTheme(.error)
        instructionView.configureDropShadow()
        let iconText = ["🤔", "😳", "🙄", "😶"].sm_random()!
        instructionView.configureContent(title: "Warning", body: "Consider yourself warned.", iconText: iconText)
        instructionView.button?.isHidden = true
        SwiftMessages.show(view: instructionView)
        */
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


