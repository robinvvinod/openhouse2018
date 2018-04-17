//
//  CurriculumViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 12/4/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit

class CurriculumViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	var subjects = ["English Language", "Mother Tongue Languages", "Mathematics", "Integrated Humanities", "Science", "Sports and Wellness"]
	var images = [#imageLiteral(resourceName: "currIcon"),#imageLiteral(resourceName: "currIcon"),#imageLiteral(resourceName: "currIcon"),#imageLiteral(resourceName: "currIcon"),#imageLiteral(resourceName: "currIcon"),#imageLiteral(resourceName: "currIcon")]
	var links = ["http://www.sst.edu.sg/learning-sst/academic-course-of-study/english-language",
				 "http://www.sst.edu.sg/learning-sst/academic-course-of-study/mother-tongue-languages",
				 "http://www.sst.edu.sg/learning-sst/academic-course-of-study/mathematics",
				 "http://www.sst.edu.sg/learning-sst/academic-course-of-study/integrated-humanities",
				 "http://www.sst.edu.sg/learning-sst/academic-course-of-study/science",
				 "http://www.sst.edu.sg/learning-sst/academic-course-of-study/sports-and-wellness"]
	
	var url = String()
	
	@IBOutlet var curriculumCollectionView: UICollectionView!
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return subjects.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "curriculumCell", for: indexPath) as! CurriculumCollectionViewCell
		
		// Configure the cell
		cell.curriculumFlavourImage.image = images[indexPath.item]
		cell.curriculumText.text = subjects[indexPath.item]
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		url = links[indexPath.item]
		performSegue(withIdentifier: "showWebView", sender: self)
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		curriculumCollectionView.delegate = self
		curriculumCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showWebView" {
			let vc = segue.destination as! WebViewController
			vc.url = url
		}
    }
	

}

class CurriculumCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var curriculumFlavourImage: UIImageView!
	@IBOutlet weak var curriculumText: UILabel!
}
