//
//  MapViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 13/4/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UIScrollViewDelegate {
	
	@IBOutlet weak var mapScrollView: UIScrollView!
	@IBOutlet weak var mapView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
        mapScrollView.maximumZoomScale = 6.0
        mapScrollView.minimumZoomScale = 1.0
		mapScrollView.delegate = self
        mapView.isUserInteractionEnabled = true
        
		
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.mapView
    }

}
