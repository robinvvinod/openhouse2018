//
//  CurriculumInfo.swift
//  openhouse2018
//
//  Created by Orbit on 26/4/18.
//  Copyright © 2018 Robin Vinod. All rights reserved.
//

import UIKit

struct currSubjects {
	var subjects: [String]
	var images: [UIImage]
	var locations: [String]?
	var timings: [[String]]?
	
	func nextTiming(forSubject subject: String) -> String? {
		if !subjects.contains(subject) {
			return nil
		}
		if timings == nil {
			return nil
		}
		var timeString: [String]!
		if (timings?.count)! > 1 {
			timeString = timings![subjects.index(of: subject)!]
		} else {
			timeString = timings![0]
		}
		//Convert and check. I've no time so its TBD for now.
		return nil
	}
	
	func getImage(forSubject subject: String) -> UIImage {
		if images.count > 1 {
			return images[subjects.index(of: subject)!]
		}
		return images[0]
	}
}

var ShowcaseSubjects = currSubjects(subjects: [
	"Chemistry",
	"Physics",
	"Biology",
	"Biotechnology",
	"Electronics"
	], images: [
	#imageLiteral(resourceName: "currIcon")
	], locations: [
	"Chem Lab 2 (Block C Lvl 1)",
	"Bio Lab 2 (Block C Lvl 1)",
	"Bio Lab 1 (Block C Lvl 1)",
	"Biotech Lab 1 (Block C Lvl 1)",
	"Engineering Lab (Block C Lvl 2)"
	], timings: [
	["10:30 - 11:30","12:30 - 13:30","14:00 - 15:00","15:30 - 16:30"]
	])

var CurriculumSubjectList = [ShowcaseSubjects]
