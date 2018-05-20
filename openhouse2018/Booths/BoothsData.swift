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
}

var showcases = [
	Subject(subject: "Chemistry", location: "Blk C Lvl 1, Chem Lab 2"),
	Subject(subject: "Physics", location: "Blk C Lvl 1, Bio Lab 2"),
	Subject(subject: "Biology", location: "Blk C Lvl 1, Bio Lab 1"),
	Subject(subject: "Biotechnology", location: "Blk C Lvl 1, Biotech Lab 1"),
	Subject(subject: "Electronics", location: "Blk C Lvl 2, Engineering Lab"),
	Subject(subject: "Science TDP", location: "Blk C Lvl 2, Physics Lab 1")
]

var ccas = [
	Subject(subject: "Astronomy", location: "Blk A Atrium, Foyer"),
	Subject(subject: "Athletics (Track)", location: "Blk A Atrium, Foyer"),
	Subject(subject: "Basketball", location: "Blk A Atrium, Foyer"),
	Subject(subject: "Fencing", location: "Blk A Atrium, Foyer"),
	Subject(subject: "Media Club", location: "Blk A Atrium, Foyer"),
	Subject(subject: "Showchoir", location: "Blk A Atrium, Foyer"),
	
	Subject(subject: "Scouts", location: "Blk A Atrium, Foyer"),
	Subject(subject: "Robotics", location: "Blk A Atrium, Foyer"),
	Subject(subject: "SYFC", location: "Blk A Atrium, Foyer")
]

var academics = [
	Subject(subject: "ACE", location: "Blk C Lvl 2, Outside Maker Lab"),
	Subject(subject: "English", location: "Blk C Lvl 2, Outside Maker Lab"),
	Subject(subject: "IH", location: "Blk C Lvl 2, Outside Maker Lab"),
	Subject(subject: "Mathematics", location: "Blk C Lvl 2, Outside Maker Lab"),
	Subject(subject: "Chinese", location: "Blk C Lvl 2, Outside Maker Lab"),
	Subject(subject: "Malay", location: "Blk C Lvl 2, Outside Maker Lab"),
	Subject(subject: "Tamil", location: "Blk C Lvl 2, Outside Maker Lab"),
	Subject(subject: "S & W", location: "Blk C Lvl 2, Outside Maker Lab")
]

var data = [showcases, ccas, academics]
