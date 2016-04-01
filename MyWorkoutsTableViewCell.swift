//
//  MyWorkoutsTableViewCell.swift
//  FitGeek
//
//  Created by MU IT Program on 3/31/16.
//  Copyright © 2016 Teddy Ivanov. All rights reserved.
//

import UIKit

class MyWorkoutsTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbNailImageView: UIImageView!
    
    @IBOutlet weak var nameOfWorkout: UILabel!
    
    @IBOutlet weak var descriptionOfWorkout: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
