//
//  VideoCollection.swift
//  FitGeek
//
//  Created by MU IT Program on 3/31/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import Foundation

class ExerciseCollection {

//class name with constructing an instance of this class.
static let sharedInstance = ExerciseCollection(fileName: "workouts")

private init(fileName:String) {
    loadFromJSONFile(fileName)
}

//All ways to do the same thing
var allExercises:[Exercise] = Array<Exercise>()
var exercises:[Exercise] = Array<Exercise>()
var workouts:[Workout] = Array<Workout>()
    
//It is inside the application, it can only be read cant write to it.
//This is different has its own file system. They refer to the sandbox. the sandbox restricts apps to writing to each other. Apps can read and write from their own sandbox
private func loadFromJSONFile(fileName: String) {
    let bundle = NSBundle.mainBundle()
    //Compound if let state, like 2 if let put together.
    if let path = bundle.pathForResource(fileName, ofType: "json"), jsonData = NSData(contentsOfFile: path) {
        parseJson(jsonData)
    }
}
    
private func parseJson(jsonData: NSData)
{
    workouts = Array<Workout>()
    exercises = Array<Exercise>()
    allExercises = Array<Exercise>()
    
    var jsonResultWrapped: NSDictionary?
    do
    {
        jsonResultWrapped = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
    }
    catch
    {
        return
    }
    if let jsonResult = jsonResultWrapped where jsonResult.count > 0
    {
        if let status = jsonResult["status"] as? String where status == "ok"
        {
            if let workoutlist = jsonResult["workouts"] as? NSArray
            {
                for workout in workoutlist
                {
                    if let Wtitle = workout["title"] as? String,
                    Wdescription = workout["description"] as? String,
                    Wimage = workout["image"] as? String
                    {
                        if let exerciseList = workout["exercises"] as? NSArray
                        {
                            if !exercises.isEmpty
                            {
                                exercises.removeAll()
                            }
                            for exercise in exerciseList
                            {
                                if let image = exercise["image"] as? String,
                                title = exercise["title"] as? String,
                                description = exercise["description"] as? String,
                                equipment = exercise["equipment"] as? String,
                                tips = exercise["tips"] as? String,
                                video = exercise["video"] as? String,
                                time = exercise["time"] as? String
                                {
                                    self.allExercises.append(Exercise(image: image, title: title, description: description, equipment: equipment, tips: tips, video:video, dateString: time))
                                
                                    self.exercises.append(Exercise(image: image, title: title, description: description, equipment: equipment, tips: tips, video:video, dateString: time))
                                }
                                
                            }
                        }
                          self.workouts.append(Workout(title: Wtitle, description: Wdescription, image: Wimage, exercises: exercises))
                    }
                }
                
            }
        }
    }
}
/*
private func parseJson(jsonData: NSData) {
    exercises = Array<Exercise>()
    var jsonResultWrapped: NSDictionary?
    do {
        //Used to parse Json, Its job to parse atleast the top level object. Dicitionary is key value pairs
        jsonResultWrapped = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
    } catch {
        return
    }
    //Can check in a where condition if another piece of data is in the state you want it to be in, used to avoid too many if lets
    if let jsonResult = jsonResultWrapped where jsonResult.count > 0
    {
        if let status = jsonResult["status"] as? String where status == "ok"
        {
            if let exerciseList = jsonResult["photos"] as? NSArray
            {
                //in is another condition word that runs through the entire NSAarry.
                for exercise in exerciseList
                {
                    if let fileName = exercise["image"] as? String,
                        title = exercise["title"] as? String,
                        description = exercise["description"] as? String,
                        equipment = exercise["equipment"] as? String,
                        tips = exercise["tips"] as? String,
                        time = exercise["time"] as? String
                    {
                        
                        self.exercises.append(Exercise(fileName: fileName, title: title, description: description,
                            equipment: equipment, tips: tips, dateString: time))
                    }
                }
            }
        }
    }
}
*/
func filter(searchText: String) -> Array<Exercise> {
    if searchText.isEmpty {
        return exercises
    }
    
    var filteredVideos = Array<Exercise>()
    
    for video in exercises {
        if video.title.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil {
            filteredVideos.append(video)
        } else if video.description.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil {
            filteredVideos.append(video)
        }
    }
    return filteredVideos
    }
}
