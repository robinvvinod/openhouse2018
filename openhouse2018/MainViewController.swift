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
    
    @IBOutlet var comingnext: CardHighlight!
    @IBOutlet var aboutSST: CardPlayer!
    
    // let comingnext = CardHighlight(frame: CGRect(x: 30, y: 30, width: 300 , height: 240))
    // let aboutSST = CardPlayer(frame: CGRect(x: 30, y: 290, width: 300 , height: 360))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comingnext.backgroundColor = UIColor(red: 127/255, green: 219/255, blue: 255/255, alpha: 1)
        comingnext.icon = UIImage(named: "ssticon")
        comingnext.title = "Coming up\nnext"
        comingnext.itemTitle = "Starting soon:"
        comingnext.itemSubtitle = "Tap to enlarge"
        comingnext.textColor = UIColor.white
        
        comingnext.hasParallax = true
        
        let comingnextVC = storyboard!.instantiateViewController(withIdentifier: "CardContent")
        comingnext.shouldPresent(comingnextVC, from: self, fullscreen: false)
        
        //
        
        aboutSST.textColor = UIColor.black
        aboutSST.videoSource = URL(string: "https://firebasestorage.googleapis.com/v0/b/open-house-2018.appspot.com/o/SST%20Homepage%202017.mp4?alt=media&token=697d1687-cd5b-493c-9732-57559824dfad")
        aboutSST.shouldDisplayPlayer(from: self)
        
        aboutSST.playerCover = UIImage(named: "sstlogo")!
        aboutSST.playImage = UIImage(named: "CardPlayerPlayIcon")!
        
        aboutSST.isAutoplayEnabled = true
        aboutSST.shouldRestartVideoWhenPlaybackEnds = true
        
        aboutSST.title = "Our School"
        aboutSST.subtitle = "Tap to learn more about SST "
        aboutSST.category = "About SST"
        aboutSST.hasParallax = true
        
        let aboutSSTVC = storyboard!.instantiateViewController(withIdentifier: "aboutSSTVC")
        aboutSST.shouldPresent(aboutSSTVC, from: self, fullscreen: false)
        
    }
    
    @objc func aboutSSTBtnAction(_ button: UIButton) {
        print("Success")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

