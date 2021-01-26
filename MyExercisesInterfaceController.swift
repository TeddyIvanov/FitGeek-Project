//
//  MyExercisesInterfaceController.swift
//  FitGeekProject
//
//  Created by MU IT Program on 4/12/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import WatchKit
import Foundation

class MyExercisesInterfaceController: WKInterfaceController {
    
    @IBOutlet var exerciseTable: WKInterfaceTable!
    
    var w: Workout?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.setTitle("Workout")
        
        w = context as? Workout
        
        exerciseTable.setNumberOfRows(w!.exercises.count, withRowType: "MyExercisesTableRowController")
        
        for (index, exercise) in w!.exercises.enumerate() {
            let row = exerciseTable.rowControllerAtIndex(index) as! MyExercisesTableRowController
            row.nameOfExerciseLabel.setText(exercise.title)
        }
        

        
        // Configure interface objects here.
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        let exercise = w!.exercises[rowIndex]
        return exercise
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

}
