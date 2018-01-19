//
//  NextViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 10/1/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit
import StatusAlert

class NextViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    let swipeAlert = StatusAlert.instantiate(withImage: UIImage(named: "Some image name"),
                                             title: "Instructions",
                                             message: "You can swipe up or tap outside the card edges to go back to the main page",
                                             canBePickedOrDismissed: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeAlert.show(in: mainView)
        
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
