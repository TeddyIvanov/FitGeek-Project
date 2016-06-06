//
//  ExerciseTableViewCell.swift
//  FitGeekProject
//
//  Created by MU IT Program on 4/7/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbNailImage: UIImageView!
    @IBOutlet weak var nameOfExercise: UILabel!
    @IBOutlet weak var descriptionOfExercise: UILabel!
    
    @IBOutlet weak var exerciseThumbNailImage: UIImageView!
    
    @IBOutlet weak var libraryNameOfExercise: UILabel!
    
    @IBOutlet weak var libraryDescriptionOfExercise: UILabel!
    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
