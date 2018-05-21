//
//  ComingNextViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 12/4/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit
import SwiftMessages

class ComingNextViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var nextEvents = [[String : String]]()
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return nextEvents.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "comingNextCell", for: indexPath)
		
		// Configure the cell...
		cell.textLabel?.text = nextEvents[indexPath.row]["Name"]!
		cell.detailTextLabel?.text = nextEvents[indexPath.row]["Time"]!
		
		return cell
	}
	
	@IBOutlet weak var comingUpNextTable: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		comingUpNextTable.delegate = self
		comingUpNextTable.dataSource = self

        // Do any additional setup after loading the view.
    }
	
	override func viewDidAppear(_ animated: Bool) {
		
		//Empty cache and restart
		nextEvents.removeAll()
		
		let calendarComponents: Set<Calendar.Component> = [
			.month,
			.day,
			.hour,
			.minute
		]
		
		let timeData = Calendar.current.dateComponents(calendarComponents, from: Date())
		
		let dayCheck = timeData.day! == 26 && timeData.month! == 5
		if dayCheck == false { 
			SwiftMessages.defaultConfig.presentationStyle = .center
			SwiftMessages.defaultConfig.duration = .seconds(seconds: 10)
			let dayAlert = MessageView.viewFromNib(layout: .centeredView)
			dayAlert.configureTheme(.warning)
			dayAlert.configureDropShadow()
			dayAlert.button?.isHidden = true
			dayAlert.configureContent(title: "It's not today...", body: "However, SST Open House 2018 does start on 26 May, we hope to see you there!")
			SwiftMessages.show(view: dayAlert)
		} else {
			let allEvents = slot1+slot2+slot3+slot4+slot5+slot6+slot7
			var requiredEvents = ["President / Vice-President Talk", "Student Panel", "SSTED Talks", "Everyday Innovations"]
			
			for event in allEvents {
				let timeStartString = String(event["Time"]?.prefix(4) ?? "    ")
				let eventStartHour = Int(timeStartString.prefix(2))
				let eventStartMin = Int(timeStartString.suffix(2))
				
				let timeCheck = (eventStartHour! > timeData.hour! || eventStartHour! == timeData.hour! && eventStartMin! > timeData.minute!)
				
				//let timeCheckTest = (eventStartHour! > 0 || eventStartHour! == 0 && eventStartMin! > 0)
				
				if requiredEvents.contains(event["Name"]!) && timeCheck {
					requiredEvents.remove(at: requiredEvents.index(of: event["Name"]!)!)
					nextEvents.append(event)
				}
			}
			
			if nextEvents.count == 0 {
				SwiftMessages.defaultConfig.presentationStyle = .center
				SwiftMessages.defaultConfig.duration = .seconds(seconds: 10)
				let countAlert = MessageView.viewFromNib(layout: .centeredView)
				countAlert.configureTheme(.info)
				countAlert.configureDropShadow()
				countAlert.button?.isHidden = true
				countAlert.configureContent(title: "Thank you for coming!", body: "All events have ended.")
				SwiftMessages.show(view: countAlert)
			}
		}
		
		comingUpNextTable.reloadData()
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
