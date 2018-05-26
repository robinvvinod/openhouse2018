//
//  MainViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 9/1/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit
import SwiftMessages
import SafariServices

class MainViewController: UIViewController, UISearchBarDelegate, UIGestureRecognizerDelegate {
    
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var gradientView: UIView!
    @IBOutlet var comingnext: CardHighlight!
    @IBOutlet var aboutSST: CardPlayer!
    @IBOutlet var schedule: CardHighlight!
    @IBOutlet var map: CardHighlight!
    @IBOutlet var booths: CardHighlight!
    @IBOutlet var redemption: CardHighlight!
    @IBOutlet var facebookShare: UIImageView!
    @IBOutlet var twitterShare: UIImageView!
    @IBOutlet var instagramShare: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Initialisation
        
        // -------------------------------------------------------------------
        
		searchBar.delegate = self
		self.hideKeyboard()
        
        // Facebook
        let fbRecogniser = UITapGestureRecognizer(target: self, action: #selector(facebook(sender:)))
        fbRecogniser.delegate = self
        self.facebookShare.addGestureRecognizer(fbRecogniser)
        self.facebookShare.isUserInteractionEnabled = true
        
        // Twitter
        let twitterRecogniser = UITapGestureRecognizer(target: self, action: #selector(twitter(sender:)))
        twitterRecogniser.delegate = self
        self.twitterShare.addGestureRecognizer(twitterRecogniser)
        self.twitterShare.isUserInteractionEnabled = true
        
        // Instagram
        let instagramRecogniser = UITapGestureRecognizer(target: self, action: #selector(instagram(sender:)))
        instagramRecogniser.delegate = self
        self.instagramShare.addGestureRecognizer(instagramRecogniser)
        self.instagramShare.isUserInteractionEnabled = true
        
        // Display instructions if first launch
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if !launchedBefore {
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            UserDefaults.standard.set(0, forKey: "codes") 
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
        
        // -------------------------------------------------------------------

        
        // About SST
        
        aboutSST.textColor = UIColor.black
        aboutSST.playerCover = UIImage(named: "sstsketch")!
        aboutSST.playImage = UIImage(named: "CardPlayerPlayIcon")!
        aboutSST.videoSource = URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType:"mp4")!)
        aboutSST.shouldDisplayPlayer(from: self)
        
        aboutSST.isAutoplayEnabled = true
        aboutSST.shouldRestartVideoWhenPlaybackEnds = true
        
        aboutSST.title = "Our School"
        aboutSST.titleSize = 22
        aboutSST.subtitle = "Learn more about SST "
        aboutSST.category = "About SST"
        aboutSST.subtitleSize = 16
        aboutSST.hasParallax = false
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedAbout(sender:)))
        tapRecognizer.delegate = self
        self.aboutSST.addGestureRecognizer(tapRecognizer)
        self.aboutSST.isUserInteractionEnabled = true
        
        // Coming Next
        
        comingnext.backgroundImage = UIImage(named: "comingupnextBg")
        comingnext.title = "Coming up next"
        comingnext.itemTitle = "Activities that are starting soon"
        comingnext.itemSubtitle = ""
        comingnext.textColor = UIColor.white
        
        comingnext.hasParallax = false
        
        let comingnextVC = storyboard!.instantiateViewController(withIdentifier: "comingnextVC")
        comingnext.shouldPresent(comingnextVC, from: self, fullscreen: true)
        
        // Schedule
        
        schedule.backgroundImage = UIImage(named: "activitiesBg")
        schedule.title = "Activities"
        schedule.itemTitle = "See the activities \ngoing on"
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
        
        booths.backgroundImage = UIImage(named: "boothsBg")
        booths.title = "Booths"
        booths.itemTitle = "Check out the booths\naround the school"
        booths.itemSubtitle = ""
        booths.textColor = UIColor.white
        
        booths.hasParallax = false
        
        let boothsVC = storyboard!.instantiateViewController(withIdentifier: "boothsVC")
        booths.shouldPresent(boothsVC, from: self, fullscreen: true)
        
        // Redemption
        
        redemption.backgroundImage = UIImage(named: "redemptionBg")
        redemption.title = "Redemption"
        redemption.itemTitle = "Collect codes at booths\nto win attractive prizes!"
        redemption.itemSubtitle = ""
        redemption.textColor = UIColor.white
        
        redemption.hasParallax = false
        
        let redemptionVC = storyboard!.instantiateViewController(withIdentifier: "redemptionVC")
        redemption.shouldPresent(redemptionVC, from: self, fullscreen: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Handling UI and cosmetic changes when view refreshes after exiting a page
        
        searchBar.text = ""
        aboutSST.play()
        SwiftMessages.hide()
    }
	
    // Displaying search query
    
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
		var searchTerm = searchBar.text
		searchTerm = searchTerm?.replacingOccurrences(of: " ", with: "+")
		let url = URL(string: "http://www.sst.edu.sg/?s="+searchTerm!)!
        let webPage = SFSafariViewController(url: url)
		
		searchBar.resignFirstResponder()
		
		self.present(webPage, animated: true, completion: nil)
	}
    
    // About SST Web Page
    
    @objc func tappedAbout(sender: UITapGestureRecognizer) {
        
        let url = URL(string: "http://www.sst.edu.sg/our-school/about-sst/")!
        let webPage = SFSafariViewController(url: url)
        self.present(webPage, animated: true, completion: nil)
    }
    
    // SOCIAL BUTTONS
    
    // -----------------------------------------------------------------------
    
    // Facebook
    
    @objc func facebook(sender: UITapGestureRecognizer) {
        let url = URL(string: "https://www.facebook.com/ssts.1technologydrive/")!
        let webPage = SFSafariViewController(url: url)
        self.present(webPage, animated: true, completion: nil)
    }
    
    // Twitter
    
    @objc func twitter(sender: UITapGestureRecognizer) {
        let url = URL(string: "https://twitter.com/sstsingapore?lang=en")!
        let webPage = SFSafariViewController(url: url)
        self.present(webPage, animated: true, completion: nil)
    }
    
    // Instagram
    
    @objc func instagram(sender: UITapGestureRecognizer) {
        let url = URL(string: "https://www.instagram.com/sstudents.life/?hl=en")!
        let webPage = SFSafariViewController(url: url)
        self.present(webPage, animated: true, completion: nil)
    }
    	
    // sstinc.org
    
    @IBAction func sstIncSocialButton(_ sender: Any) {
        let url = URL(string: "https://www.sstinc.org/")!
        let webPage = SFSafariViewController(url: url)
        self.present(webPage, animated: true, completion: nil)
    }
    
    // ----------------------------------------------------------------------
    
    // Feedback Form
    
    @IBAction func feedbackForm(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSfo3PkCCZWkkbqoxOQZbHvVRMv38NNl6Hzlw49tItABJrlUog/viewform")!
        let webPage = SFSafariViewController(url: url)
        self.present(webPage, animated: true, completion: nil)
    }
    
    // Hide status bar in main page
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

extension UIViewController
{
	func hideKeyboard()
	{
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(
			target: self,
			action: #selector(UIViewController.dismissKeyboard))
		
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissKeyboard()
	{
		view.endEditing(true)
	}
}
