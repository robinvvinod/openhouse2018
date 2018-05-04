//
//  CurriculumInfo.swift
//  openhouse2018
//
//  Created by Orbit on 26/4/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit

struct Subject {
	var subject: String
	var location: String
	var timings: [String]?
	
	func nextTiming() -> [String]? {
		
		if timings != nil && Calendar.current.component(.month, from: Date()) == 5 && Calendar.current.component(.day, from: Date()) == 26 {
			for timeString in timings! {
				let startingHour = Int(timeString.prefix(2))
				let startingMinute = Int(timeString.prefix(5).suffix(2))
				
				let beforeStartingHour = Calendar.current.component(.hour, from: Date()) < startingHour!
				let beforeStartingMinute = (Calendar.current.component(.minute, from: Date()) < startingMinute! && Calendar.current.component(.hour, from: Date()) == startingHour!)
				
				if beforeStartingHour || beforeStartingMinute {
					let minutesToStart = startingMinute! - Calendar.current.component(.minute, from: Date()) + ((startingHour! - Calendar.current.component(.hour, from: Date()))*60)
					return [timeString, (String(minutesToStart/60) +  "h " + String(minutesToStart%60) + "min")]
				}
			}
		}
		
		//No timings available
		return nil
	}
}

var showcases = [
	Subject(subject: "Chemistry", location: "Chem Lab 2 (Block C Lvl 1)", timings: ["10:30 - 11:30", "12:30 - 13:30", "14:00 - 15:00", "15:30 - 16:30"]),
	Subject(subject: "Physics", location: "Bio Lab 2 (Block C Lvl 1)", timings: ["10:30 - 11:30", "12:30 - 13:30", "14:00 - 15:00", "15:30 - 16:30"]),
	Subject(subject: "Biology", location: "Bio Lab 1 (Block C Lvl 1)", timings: ["10:30 - 11:30", "12:30 - 13:30", "14:00 - 15:00", "15:30 - 16:30"]),
	Subject(subject: "Biotechnology", location: "Biotech Lab 1 (Block C Lvl 1)", timings: ["10:30 - 11:30", "12:30 - 13:30", "14:00 - 15:00", "15:30 - 16:30"]),
	Subject(subject: "Electronics", location: "Engineering Lab - FOE(Block C Lvl 2)", timings: ["10:30 - 11:30", "12:30 - 13:30", "14:00 - 15:00", "15:30 - 16:30"]),
	Subject(subject: "Science TDP", location: "Physics Lab 1 (Block C Lvl 2)", timings: nil)
]

var ccas = [
	Subject(subject: "Astronomy", location: "Blk A Atrium, Foyer", timings: nil),
	Subject(subject: "Athletics (Track)", location: "Blk A Atrium, Foyer", timings: nil),
	Subject(subject: "Basketball", location: "Blk A Atrium, Foyer", timings: nil),
	Subject(subject: "Fencing", location: "Blk A Atrium, Foyer", timings: nil),
	Subject(subject: "Media Club", location: "Blk A Atrium, Foyer", timings: nil),
	Subject(subject: "Showchoir", location: "Blk A Atrium, Foyer", timings: nil),
	Subject(subject: "Scouts", location: "Blk A Atrium, Foyer", timings: nil),
	Subject(subject: "Robotics", location: "Blk A Atrium, Foyer", timings: nil),
	Subject(subject: "SYFC", location: "Blk A Atrium, Foyer", timings: nil)
]

var academics = [
	Subject(subject: "ACE", location: "Level 2, Outside Maker Lab", timings: nil),
	Subject(subject: "English", location: "Level 2, Outside Maker Lab", timings: nil),
	Subject(subject: "IH", location: "Level 2, Outside Maker Lab", timings: nil),
	Subject(subject: "Mathematics", location: "Level 2, Outside Maker Lab", timings: nil),
	Subject(subject: "Chinese", location: "Level 2, Outside Maker Lab", timings: nil),
	Subject(subject: "Malay", location: "Level 2, Outside Maker Lab", timings: nil),
	Subject(subject: "Tamil", location: "Level 2, Outside Maker Lab", timings: nil),
	Subject(subject: "S & W", location: "Level 2, Outside Maker Lab", timings: nil)
]

var data = [showcases, ccas, academics]
