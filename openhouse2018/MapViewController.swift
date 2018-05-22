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
	@IBOutlet weak var boundView: UIView!
	
	@IBOutlet weak var topMapViewConstraint: NSLayoutConstraint!
	@IBOutlet weak var bottomMapViewConstraint: NSLayoutConstraint!
	@IBOutlet weak var leadingMapViewConstraint: NSLayoutConstraint!
	@IBOutlet weak var trailingMapViewConstraint: NSLayoutConstraint!
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		updateMinZoomScaleForSize(boundView.bounds.size)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		mapScrollView.delegate = self
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func updateMinZoomScaleForSize(_ size: CGSize) {
		let widthScale = size.width / mapView.bounds.width
		let heightScale = size.height / mapView.bounds.height
		let minScale = min(widthScale, heightScale)
		
		mapScrollView.minimumZoomScale = minScale
		mapScrollView.zoomScale = minScale
	}
	
	func scrollViewDidZoom(_ scrollView: UIScrollView) {
		updateConstraintsForSize(boundView.bounds.size)
	}
	
	func updateConstraintsForSize(_ size: CGSize) {
		
		let yOffset = max(0, (size.height - mapView.frame.height) / 2)
		topMapViewConstraint.constant = yOffset
		bottomMapViewConstraint.constant = yOffset
		
		let xOffset = max(0, (size.width - mapView.frame.width) / 2)
		leadingMapViewConstraint.constant = xOffset
		trailingMapViewConstraint.constant = xOffset
		
		view.layoutIfNeeded()
	}
	
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return mapView
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
