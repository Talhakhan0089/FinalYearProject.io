//
//  WeeklyCollectionViewCell.swift
//  Back On Your Feet
//
//  Created by Talha Khan on 23/06/2019.
//  Copyright © 2019 Talha Khan. All rights reserved.
//

import UIKit

class WeeklyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var WeeklyDietPlanImage: UIImageView!
    @IBOutlet weak var WeekLyDietPlanLabel: UILabel!
    override func awakeFromNib() {
        WeeklyDietPlanImage.layer.cornerRadius = 10
        WeeklyDietPlanImage.layer.masksToBounds = true
    
    }
}
