//
//  WebViewController.swift
//  openhouse2018
//
//  Created by Orbit on 16/4/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate, UIScrollViewDelegate {
	
	@IBOutlet weak var backButton: UIButton!
	@IBAction func goBack(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	var url = String()
	var curriculumWebView: WKWebView!
	
	func loadWebView(url: String) {
		curriculumWebView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
		curriculumWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		view = curriculumWebView
		curriculumWebView.uiDelegate = self
		let myURL = URL(string: url)
		let myRequest = URLRequest(url: myURL!)
		curriculumWebView.load(myRequest)
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		backButton.isHidden = true
		loadWebView(url: url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
