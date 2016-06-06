//
//  CustomWorkoutExcerciseTableViewController.swift
//  FitGeek
//
//  Created by MU IT Program on 4/7/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import UIKit

class CustomWorkoutExcerciseTableViewController: UITableViewController {

    var workout: Workout?
    var exercisesInWorkout: [Exercise]!
    
    var alertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Workout"
        if let w = workout{
            exercisesInWorkout = w.exercise
        }
        /*
        alertController = UIAlertController(title: "", message: "You can customize your workouts", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let addWorkoutAction = UIAlertAction(title: "Add to Workout", style: .Default) { (action) in
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
        return exercisesInWorkout.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
            
        let cell = tableView.dequeueReusableCellWithIdentifier("Exercises", forIndexPath: indexPath) as! ExerciseTableViewCell
        
            //cell.nameOfExercise.text = example[indexPath.row]
            //cell.descriptionOfExercise.text = example2[indexPath.row]
            let exercise = exercisesInWorkout[indexPath.row]
            cell.nameOfExercise.text = exercise.title
            cell.descriptionOfExercise.text = exercise.description
            cell.thumbNailImage.image = UIImage(named: exercise.image)


        // Configure the cell...

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller: FitnessPlayerViewController = segue.destinationViewController as! FitnessPlayerViewController
        
        if let row = self.tableView.indexPathForSelectedRow?.row {
            controller.exercise = exercisesInWorkout[row]
        }
    }

 
    @IBAction func showActionSheet(sender: AnyObject) {
         self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return workout?.title
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    /*
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let synchAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Synch") { (action , indexPath ) -> Void in
            self.editing = false
            print("Synching to watch")
        }
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete") { (action , indexPath) -> Void in
            self.editing = false
            print("Delete button pressed")
           // self.example.removeAtIndex(indexPath.row)
           // self.example2.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        deleteAction.backgroundColor = UIColor.redColor()
        synchAction.backgroundColor = UIColor.blueColor()
        return [synchAction, deleteAction]
    }
    */
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            example.removeAtIndex(indexPath.row)
            example2.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
