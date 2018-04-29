//
//  CurriculumViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 12/4/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit

class CurriculumViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	var url = String()
	
	@IBOutlet var curriculumCollectionView: UICollectionView!
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return CurriculumSubjectList.count
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "curriculumCell", for: indexPath) as! CurriculumCollectionViewCell
		
		// Configure the cell
		let currentSection = CurriculumSubjectList[indexPath.section]
		let currentSubject = CurriculumSubjectList[indexPath.section].subjects[indexPath.row]
		cell.curriculumText.text = currentSubject
		cell.curriculumFlavourImage.image = currentSection.getImage(forSubject: currentSubject)
		
		return cell
	}
    
	override func viewDidLoad() {
        super.viewDidLoad()
		view.layoutIfNeeded()

        // Do any additional setup after loading the view.
		curriculumCollectionView.delegate = self
		curriculumCollectionView.dataSource = self
    }
	
	override func viewWillAppear(_ animated: Bool) {
		self.curriculumCollectionView.reloadData()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
    }
	
	

}

class CurriculumCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var curriculumFlavourImage: UIImageView!
	@IBOutlet weak var curriculumText: UILabel!
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
