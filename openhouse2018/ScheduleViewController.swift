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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
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
