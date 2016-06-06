//
//  FitnessPlayerViewController.swift
//  FitGeek
//
//  Created by Teodor Ivanov on 4/14/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class FitnessPlayerViewController: UIViewController {

    @IBOutlet weak var nameOfExerciseLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameOfEquipmentLabel: UILabel!
    
    @IBOutlet weak var tipsLabel: UILabel!
  //  @IBOutlet weak var timeLabel: UILabel!
    
    
    
    var avPlayerViewController: AVPlayerViewController?
    var avPlayer: AVPlayer?
    var avPlayerItem: AVPlayerItem?
    var exercise: Exercise?
    var videoFileName: String!
    var videoFileExtension = "m4v"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Exercise"
        
        if let e = exercise
        {
            videoFileName = e.video
            nameOfExerciseLabel.text = e.title
            descriptionLabel.text = e.description
            nameOfEquipmentLabel.text = e.equipment
            tipsLabel.text = e.tips
         //  timeLabel.text = "00:10"
        }
        if let url = NSBundle.mainBundle().URLForResource(videoFileName, withExtension: videoFileExtension) {
            if let playerController = avPlayerViewController {
                playerController.showsPlaybackControls = true
                avPlayerItem = AVPlayerItem(URL: url)
                if let avPlayerItem = avPlayerItem {
                    avPlayer = AVPlayer(playerItem: avPlayerItem)
                    if let avPlayer = avPlayer {
                        playerController.player = avPlayer
                        // the following can be called to autostart the playback
                        avPlayer.play()
                        
                    }
                }
            }
        }
    }
    // Do any additional setup after loading the view.
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let viewController = segue.destinationViewController as? AVPlayerViewController {
            avPlayerViewController = viewController
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
