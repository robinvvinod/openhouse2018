//
//  ScheduleViewController.swift
//  openhouse2018
//
//  Created by Robin Vinod on 3/5/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit

struct Category {
    let time : String
    var items : [[String:Any]]
}

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var sections = [Category]()
    
    // 9am - 10am
    let slot1 = [["Name" : "P/VP Talk", "Time" : "0900 - 0930"]]
    // 10am - 11am
    let slot2 = [["Name" : "Student Panel", "Time" : "1000 - 1020"], ["Name" : "Chemistry Lab Session", "Time" : "1030 - 1130"], ["Name" : "Physics Lab Session", "Time" : "1030 - 1130"], ["Name" : "Biology Lab Session", "Time" : "1030 - 1130"], ["Name" : "Biotechnology Lab Session", "Time" : "1030 - 1130"], ["Name" : "Electronics Lab Session", "Time" : "1030 - 1130"], ["Name" : "SSTED Talks", "Time" : "1045 - 1130"]]
    // 11am - 12pm
    let slot3 = [["Name" : "Dance and Guitar Performance", "Time" : "1100 - 1130"]]
    // 12pm - 1pm
    let slot4 = [["Name" : "Student Panel", "Time" : "1200 - 1220"], ["Name" : "Chemistry Lab Session", "Time" : "1230 - 1330"], ["Name" : "Physics Lab Session", "Time" : "1230 - 1330"], ["Name" : "Biology Lab Session", "Time" : "1230 - 1330"], ["Name" : "Biotechnology Lab Session", "Time" : "1230 - 1330"], ["Name" : "Electronics Lab Session", "Time" : "1230 - 1330"], ["Name" : "SSTED Talks", "Time" : "1250 - 1330"]]
    // 1pm - 2pm
    let slot5 = [["Name" : "Dance and Guitar Performance", "Time" : "1300 - 1330"]]
    // 2pm - 3pm
    let slot6 = [["Name" : "Student Panel", "Time" : "1400 - 1420"], ["Name" : "Chemistry Lab Session", "Time" : "1400 - 1500"], ["Name" : "Physics Lab Session", "Time" : "1400 - 1500"], ["Name" : "Biology Lab Session", "Time" : "1400 - 1500"], ["Name" : "Biotechnology Lab Session", "Time" : "1400 - 1500"], ["Name" : "Electronics Lab Session", "Time" : "1400 - 1500"], ["Name" : "SSTED Talks", "Time" : "1445 - 1530"]]
    // 3pm - 4pm
    let slot7 = [["Name" : "Chemistry Lab Session", "Time" : "1530 - 1630"], ["Name" : "Physics Lab Session", "Time" : "1530 - 1630"], ["Name" : "Biology Lab Session", "Time" : "1530 - 1630"], ["Name" : "Biotechnology Lab Session", "Time" : "1530 - 1630"], ["Name" : "Electronics Lab Session", "Time" : "1530 - 1630"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        sections = [Category(time:"From 9am", items: slot1),
                    Category(time:"From 10am", items: slot2),
                    Category(time:"From 11am", items: slot3),
                    Category(time:"From 12pm", items: slot4),
                    Category(time:"From 1pm", items: slot5),
                    Category(time:"From 2pm", items: slot6),
                    Category(time:"From 3pm", items: slot7)]
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].time
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let items = self.sections[section].items
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let items = self.sections[indexPath.section].items
        let item = items[indexPath.row]
        cell?.textLabel?.text = item["Name"] as? String
        cell?.detailTextLabel?.text = item["Time"] as? String
        
        return cell!
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
