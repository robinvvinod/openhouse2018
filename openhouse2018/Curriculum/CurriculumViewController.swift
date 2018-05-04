//
//  CurriculumViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 12/4/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit

class CurriculumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if detailViewCellIndex != nil && detailViewCellIndex?.section == section {
			return data[section].count+1
		}
		return data[section].count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath == detailViewCellIndex {
			let cell = tableView.dequeueReusableCell(withIdentifier: "detailViewCell", for: indexPath)
			
			// Configure the cell...
			let currentSubject = data[indexPath.section][indexPath.row-1]
			cell.textLabel?.text = currentSubject.location
			let nextTime = currentSubject.nextTiming()
			if nextTime != nil {
				cell.detailTextLabel?.text = nextTime![0] + "(" + nextTime![1] + ")"
			} else {
				cell.detailTextLabel?.text = "Any Time"
			}
			
			return cell
		}
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "subjectViewCell", for: indexPath)
		
		// Configure the cell...
		if detailViewCellAffects(forCellAt: indexPath) {
			cell.textLabel?.text = data[indexPath.section][indexPath.row-1].subject
		} else {
			cell.textLabel?.text = data[indexPath.section][indexPath.row].subject
		}
		
		return cell
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return ["Subject Showcases", "CCA Showcase", "Academic Showcases"][section]
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath != detailViewCellIndex {
			if detailViewCellAffects(forCellAt: indexPath) {
				detailViewCellIndex = IndexPath(row: indexPath.row, section: indexPath.section)
			} else {
				detailViewCellIndex = IndexPath(row: indexPath.row+1, section: indexPath.section)
			}
		} else {
			detailViewCellIndex = nil
		}
		
		tableView.reloadData()
	}
	
	@IBOutlet weak var curriculumTableView: UITableView!
	
	var detailViewCellIndex: IndexPath?
    
	override func viewDidLoad() {
        super.viewDidLoad()
		view.layoutIfNeeded()

        // Do any additional setup after loading the view.
		curriculumTableView.delegate = self
		curriculumTableView.dataSource = self
		detailViewCellIndex = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
    }
	
	func detailViewCellAffects(forCellAt indexPath: IndexPath) -> Bool {
		return detailViewCellIndex != nil && detailViewCellIndex!.section == indexPath.section && detailViewCellIndex!.row < indexPath.row
	}

}

class ShadowView: UIView {
	//Source: https://github.com/benboecker/ShadowView
	
	/// The corner radius of the `ShadowView`, inspectable in Interface Builder
	@IBInspectable var cornerRadius: CGFloat = 5.0 {
		didSet {
			self.updateProperties()
		}
	}
	/// The shadow color of the `ShadowView`, inspectable in Interface Builder
	@IBInspectable var shadowColor: UIColor = UIColor.black {
		didSet {
			self.updateProperties()
		}
	}
	/// The shadow offset of the `ShadowView`, inspectable in Interface Builder
	@IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 2) {
		didSet {
			self.updateProperties()
		}
	}
	/// The shadow radius of the `ShadowView`, inspectable in Interface Builder
	@IBInspectable var shadowRadius: CGFloat = 4.0 {
		didSet {
			self.updateProperties()
		}
	}
	/// The shadow opacity of the `ShadowView`, inspectable in Interface Builder
	@IBInspectable var shadowOpacity: Float = 0.5 {
		didSet {
			self.updateProperties()
		}
	}
	
	/**
	Masks the layer to it's bounds and updates the layer properties and shadow path.
	*/
	override func awakeFromNib() {
		super.awakeFromNib()
		
		self.layer.masksToBounds = false
		
		self.updateProperties()
		self.updateShadowPath()
	}
	
	/**
	Updates all layer properties according to the public properties of the `ShadowView`.
	*/
	fileprivate func updateProperties() {
		self.layer.cornerRadius = self.cornerRadius
		self.layer.shadowColor = self.shadowColor.cgColor
		self.layer.shadowOffset = self.shadowOffset
		self.layer.shadowRadius = self.shadowRadius
		self.layer.shadowOpacity = self.shadowOpacity
	}
	
	/**
	Updates the bezier path of the shadow to be the same as the layer's bounds, taking the layer's corner radius into account.
	*/
	fileprivate func updateShadowPath() {
		self.layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
	}
	
	/**
	Updates the shadow path everytime the views frame changes.
	*/
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.updateShadowPath()
	}
}
