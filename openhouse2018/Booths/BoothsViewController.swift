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
		if detailViewCellIndex != nil && detailViewCellIndex?.section == section {
			return data[section].count+1
		}
		return data[section].count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		/* NOT IN USE
		if indexPath == detailViewCellIndex {
			let cell = tableView.dequeueReusableCell(withIdentifier: "detailViewCell", for: indexPath)
			
			// Configure the cell...
			let currentSubject = data[indexPath.section][indexPath.row-1]
			
			cell.textLabel?.text = currentSubject.location
			let nextTime = currentSubject.nextTiming()
			var detailText: String!
			if nextTime != nil {
				if nextTime![0] == "timebutbefore" {
					detailText = nextTime![1]
				} else if nextTime![0] == "notimeandbefore" {
					detailText = "8:30 - 4:30"
				} else {
					detailText = nextTime![0] + "(" + nextTime![1] + ")"
				}
			} else {
				detailText = "8:30 - 4:30"
			}
			
			cell.detailTextLabel?.text = detailText
			
			return cell
		}
		*/
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "subjectViewCell", for: indexPath)
		
		// Configure the cell...
		if detailViewCellAffects(forCellAt: indexPath) {
			cell.textLabel?.text = data[indexPath.section][indexPath.row-1].subject
		} else {
			cell.textLabel?.text = data[indexPath.section][indexPath.row].subject
		}
		
		if !detailViewCellInUse {
			cell.detailTextLabel?.text = data[indexPath.section][indexPath.row].location
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 90
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
	var detailViewCellInUse = false
    
	override func viewDidLoad() {
        super.viewDidLoad()
		view.layoutIfNeeded()

        // Do any additional setup after loading the view.
		curriculumTableView.delegate = self
		curriculumTableView.dataSource = self
		detailViewCellIndex = nil
		
		if !detailViewCellInUse {
			self.curriculumTableView.allowsSelection = false
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
    }
	
	func detailViewCellAffects(forCellAt indexPath: IndexPath) -> Bool {
		if detailViewCellInUse {
			return detailViewCellIndex != nil && detailViewCellIndex!.section == indexPath.section && detailViewCellIndex!.row < indexPath.row
		}
		return false
	}

}
