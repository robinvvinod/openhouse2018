//
//  ComingNextViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 12/4/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit

class ComingNextViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		<#code#>
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		<#code#>
	}
	
	@IBOutlet weak var comingUpNextTable: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		comingUpNextTable.delegate = self
		comingUpNextTable.dataSource = self

        // Do any additional setup after loading the view.
    }
	
	override func viewDidAppear(_ animated: Bool) {
		// IN TESTING
		
		let calendarComponents: Set<Calendar.Component> = [
			.month,
			.day,
			.hour,
			.minute
		]
		
		let timeData = Calendar.current.dateComponents(calendarComponents, from: Date())
		let dayCheck = timeData.day! == 26 && timeData.month! == 5
		let allEvents = slot1+slot2+slot3+slot4+slot5+slot6+slot7
		
		var nextEvents_15m = [[String : String]]()
		var nextEvents_30m = [[String : String]]()
		var nextEvents_1h = [[String : String]]()
		var nextEvents_2h = [[String : String]]()
		
		for event in allEvents{
			let timeStartString = String(event["Time"]?.prefix(4) ?? "    ")
			let eventStartHour = Int(timeStartString.prefix(2))
			let eventStartMin = Int(timeStartString.suffix(2))
			
			print(event["Name"], eventStartHour, eventStartMin)
		}
		
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
