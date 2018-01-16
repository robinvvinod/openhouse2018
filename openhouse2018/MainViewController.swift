//
//  MainViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 9/1/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit
import Cards

class MainViewController: UIViewController {
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet var comingnext: CardHighlight!
    @IBOutlet var aboutSST: CardPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comingnext.backgroundColor = UIColor(red: 127/255, green: 219/255, blue: 255/255, alpha: 1)
        comingnext.icon = UIImage(named: "ssticon")
        comingnext.title = "Coming up\nnext"
        comingnext.itemTitle = "Starting soon:"
        comingnext.itemSubtitle = "Tap to enlarge"
        comingnext.textColor = UIColor.white
        
        comingnext.hasParallax = true
        
        let comingnextVC = storyboard!.instantiateViewController(withIdentifier: "nextVC")
        comingnext.shouldPresent(comingnextVC, from: self, fullscreen: false)
        
        //
        
        aboutSST.textColor = UIColor.black
        aboutSST.videoSource = URL(string: "https://firebasestorage.googleapis.com/v0/b/open-house-2018.appspot.com/o/SST%20Homepage%202017.mp4?alt=media&token=697d1687-cd5b-493c-9732-57559824dfad")
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

