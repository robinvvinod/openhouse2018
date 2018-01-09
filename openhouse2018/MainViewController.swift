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
    
    
    let card = CardHighlight(frame: CGRect(x: 30, y: 30, width: 300 , height: 240))
    let aboutSST = CardPlayer(frame: CGRect(x: 30, y: 290, width: 300 , height: 360))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        card.backgroundColor = UIColor(red: 127/255, green: 219/255, blue: 255/255, alpha: 1)
        card.icon = UIImage(named: "ssticon")
        card.title = "Coming up\nnext"
        card.itemTitle = "Starting soon:"
        card.itemSubtitle = "Tap to enlarge"
        card.textColor = UIColor.white
        
        card.hasParallax = true
        
        let cardContentVC = storyboard!.instantiateViewController(withIdentifier: "CardContent")
        card.shouldPresent(cardContentVC, from: self, fullscreen: false)
        
        view.addSubview(card)
        
        //
        
        aboutSST.textColor = UIColor.black
        aboutSST.videoSource = URL(string: "https://youtu.be/Fe-ojtFLXRM")
        aboutSST.shouldDisplayPlayer(from: self)    //Required.
        
        //aboutSST.playerCover = UIImage(named: "mvBackground")!  // Shows while the player is loading
        aboutSST.playImage = UIImage(named: "CardPlayerPlayIcon")!  // Play button icon
        
        aboutSST.isAutoplayEnabled = true
        aboutSST.shouldRestartVideoWhenPlaybackEnds = true
        
        aboutSST.title = "Our School"
        aboutSST.subtitle = "Tap to learn more about SST "
        aboutSST.category = "About SST"
        
        let aboutSSTVC = storyboard!.instantiateViewController(withIdentifier: "CardContent")
        aboutSST.shouldPresent(aboutSSTVC, from: self, fullscreen: false)
        
        view.addSubview(aboutSST)
        
    }
    
    @objc func aboutSSTBtnAction(_ button: UIButton) {
        print("Success")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

