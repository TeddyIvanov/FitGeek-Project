//
//  VideoCollection.swift
//  FitGeek
//
//  Created by MU IT Program on 3/31/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import Foundation

class VideoCollection {

//class name with constructing an instance of this class.
static let sharedInstance = VideoCollection(fileName: "videos")

private init(fileName:String) {
    loadFromJSONFile(fileName)
}

//All ways to do the same thing
var videos:[Video] = Array<Video>()
//var photos = Array<Photo>()
//var photos: Array<Photo>() = Array<Photo>()


//It is inside the application, it can only be read cant write to it.
//This is different has its own file system. They refer to the sandbox. the sandbox restricts apps to writing to each other. Apps can read and write from their own sandbox
private func loadFromJSONFile(fileName: String) {
    let bundle = NSBundle.mainBundle()
    //Compound if let state, like 2 if let put together.
    if let path = bundle.pathForResource(fileName, ofType: "json"), jsonData = NSData(contentsOfFile: path) {
        parseJson(jsonData)
    }
}

private func parseJson(jsonData: NSData) {
    videos = Array<Video>()
    var jsonResultWrapped: NSDictionary?
    do {
        //Used to parse Json, Its job to parse atleast the top level object. Dicitionary is key value pairs
        jsonResultWrapped = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
    } catch {
        return
    }
    //Can check in a where condition if another piece of data is in the state you want it to be in, used to avoid too many if lets
    if let jsonResult = jsonResultWrapped where jsonResult.count > 0 {
        if let status = jsonResult["status"] as? String where status == "ok" {
            if let photoList = jsonResult["photos"] as? NSArray {
                //in is another condition word that runs through the entire NSAarry.
                for photo in photoList{
                    if let fileName = photo["image"] as? String,
                        title = photo["title"] as? String,
                        description = photo["description"] as? String,
                        latitude = photo["latitude"] as? Double,
                        longitude = photo["longitude"] as? Double,
                        date = photo["date"] as? String {
                            
                            self.videos.append(Video(fileName: fileName, title: title, description: description,
                                latitude: latitude, longitude: longitude, dateString: date))
                    }
                }
            }
        }
    }
}

func filter(searchText: String) -> Array<Video> {
    if searchText.isEmpty {
        return videos
    }
    
    var filteredPhotos = Array<Video>()
    
    for photo in videos {
        if photo.title.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil {
            filteredPhotos.append(photo)
        } else if photo.description.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil {
            filteredPhotos.append(photo)
        }
    }
    return filteredPhotos
    }
}
