//
//  MyFitnessPlayerInterfaceController.swift
//  FitGeekProject
//
//  Created by MU IT Program on 4/13/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import WatchKit
import Foundation

class MyFitnessPlayerInterfaceController: WKInterfaceController {
    
    @IBOutlet var moviePlayer: WKInterfaceMovie!
    
    
    var videoFileName = ""
    var videoFileExtension = "m4v"
    var exercise: Exercise?
  
    override func awakeWithContext(context: AnyObject?) {
        self.setTitle("Exercise")
        super.awakeWithContext(context)
        
        exercise = context as? Exercise
        
        videoFileName = exercise!.video
        
        let mybundle = NSBundle.mainBundle()
        if let url = mybundle.URLForResource(videoFileName, withExtension: videoFileExtension) {
            //moviePlayer.setMovieURL(url)
            //moviePlayer.setLoops(true)
            //moviePlayer.
            let options = [WKMediaPlayerControllerOptionsAutoplayKey : "true", WKMediaPlayerControllerOptionsLoopsKey : "true"]
            presentMediaPlayerControllerWithURL(url, options: options, completion: {
                didPlayToEnd, endTime, error in
                self.popController()
            })
        }
        
        // Configure interface objects here.
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
