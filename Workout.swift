//
//  Workout.swift
//  FitGeek
//
//  Created by Teodor Ivanov on 4/27/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import Foundation

class Workout {
    
    var title: String = ""
    var description: String = ""
    var image: String = ""
    var exercises: [Exercise]
    //This is an constructor in switf... initilizer
    init(title: String, description: String, image: String, exercises: [Exercise]) {
        self.title = title
        self.description = description
        self.image = image
        self.exercises = exercises
    }
}
