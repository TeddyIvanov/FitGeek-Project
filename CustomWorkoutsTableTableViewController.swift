//
//  CustomWorkoutsTableTableViewController.swift
//  FitGeek
//
//  Created by MU IT Program on 3/29/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import UIKit

class CustomWorkoutsTableTableViewController: UITableViewController {
    

    var alertController: UIAlertController!
    

    let exerciseCollection = ExerciseCollection.sharedInstance
    
    var parsedExercises: [Exercise]!
    var parsedWorkouts: [Workout]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Workouts"
        
        parsedWorkouts = exerciseCollection.workouts
        
        //print(parsedWorkouts.first?.exercise.first?.equipment)
        
        /*
        alertController = UIAlertController(title: "", message: "You can create new workouts", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let addWorkoutAction = UIAlertAction(title: "Create new Workout", style: .Default) { (action) in
            print("Add new workout")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            print("cancelled Action")
        }
        
        alertController.addAction(addWorkoutAction)
        alertController.addAction(cancelAction)
        */
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parsedWorkouts.count
        //return example.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyWorkouts", forIndexPath: indexPath) as! MyWorkoutsTableViewCell
      
        let video = parsedWorkouts[indexPath.row]
        cell.nameOfWorkout.text = video.title
        cell.descriptionOfWorkout.text = video.description
        cell.thumbNailImageView.image = UIImage(named: video.image)
        
        //cell.nameOfWorkout.text = example[indexPath.row]
        //cell.descriptionOfWorkout.text = example2[indexPath.row]
        
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller: CustomWorkoutExcerciseTableViewController = segue.destinationViewController as! CustomWorkoutExcerciseTableViewController
        
        if let row = self.tableView.indexPathForSelectedRow?.row {
            controller.workout = parsedWorkouts[row]
        }
    }

    
    @IBAction func showActionSheet(sender: AnyObject) {
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    /*
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let synchAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Synch") { (action , indexPath ) -> Void in
            self.editing = false
            print("Synching to watch")
        }
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete") { (action , indexPath) -> Void in
            self.editing = false
            print("Delete button pressed")
            //self.example.removeAtIndex(indexPath.row)
            //self.example2.removeAtIndex(indexPath.row)
            self.parsedExercises.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        deleteAction.backgroundColor = UIColor.redColor()
        synchAction.backgroundColor = UIColor.blueColor()
        return [synchAction, deleteAction]
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
