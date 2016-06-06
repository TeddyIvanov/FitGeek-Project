//
//  Video.swift
//  FitGeek
//
//  Created by MU IT Program on 3/31/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import Foundation

class Exercise {
    var image: String = ""
    var title: String = ""
    var description: String = ""
    var equipment: String = ""
    var tips: String = ""
    var video: String = ""
    var time: NSDate
    //This is an constructor in switf... initilizer
    init(image: String, title: String, description: String, equipment: String, tips: String, video: String, dateString: String) {
        self.image = image
        self.title = title
        self.description = description
        self.equipment = equipment
        self.video = video
        self.tips = tips
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "mm:ss"
        if let time = dateFormatter.dateFromString(dateString) {
            self.time = time
        } else {
            //gives the current time right now.
            self.time = NSDate(timeIntervalSinceNow: 0)
        }
    }
}