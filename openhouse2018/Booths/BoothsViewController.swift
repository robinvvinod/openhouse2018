//
//  CurriculumViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 12/4/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit

class BoothsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data[section].count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "subjectViewCell", for: indexPath)
		
		// Configure the cell...
		cell.textLabel?.text = data[indexPath.section][indexPath.row].subject
		cell.detailTextLabel?.text = data[indexPath.section][indexPath.row].location
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 90
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // Setting the follwing headers for the tableView for easier content manipulation
        
		return ["Subject Showcases", "CCA Showcase", "Academic Showcases"][section]
	}
	
	@IBOutlet weak var curriculumTableView: UITableView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
		view.layoutIfNeeded()

        // Do any additional setup after loading the view.
		curriculumTableView.delegate = self
		curriculumTableView.dataSource = self
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
