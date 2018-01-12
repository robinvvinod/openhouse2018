//
//  AboutSSTViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 10/1/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit
import WebKit

class AboutSSTViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://www.sst.edu.sg/our-school/about-sst/")
        let request = URLRequest(url: url!)
        
        webview.load(request)
        
        func webViewDidFinishLoad(webView: UIWebView!) {
            print("Webview did finish load")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
