//
//  MyWorkoutsInterfaceController.swift
//  FitGeekProject
//
//  Created by MU IT Program on 4/12/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class MyWorkoutsInterfaceController: WKInterfaceController, WCSessionDelegate {
    
    var session: WCSession!

    @IBOutlet var workoutTable: WKInterfaceTable!
    
    var parsedWorkouts: [Workout]!
    let exerciseCollection = ExerciseCollection.sharedInstance
    var w: Workout?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.setTitle("Workouts")
        parsedWorkouts = exerciseCollection.workouts
        
        
        workoutTable.setNumberOfRows(parsedWorkouts.count, withRowType: "MyWorkoutsTableViewController")
        
        for (index, workout) in parsedWorkouts.enumerate(){
            let row = workoutTable.rowControllerAtIndex(index) as! MyWorkoutsTableViewController
            row.myWorkoutsLabel.setText(workout.title)
        }
        
              // Configure interface objects here.
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        let workout = parsedWorkouts[rowIndex]
        return workout
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        if(WCSession.isSupported())
        {
            self.session = WCSession.defaultSession()
            self.session.delegate = self
            self.session.activateSession()
        }
                super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

}
