//
//  HeightWidthTableViewCell.swift
//  Back On Your Feet
//
//  Created by Talha Khan on 23/06/2019.
//  Copyright © 2019 Talha Khan. All rights reserved.
//

import UIKit

class HeightWidthTableViewCell: UITableViewCell {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var WomenLabel: UILabel!
    @IBOutlet weak var MenLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
