//
//  TableViewCell.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 05/01/17.
//  Copyright © 2017 BusinessReviewsHub. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var custnameLabel: UILabel!
    
    @IBOutlet weak var chatIcon: UIImageView!

    @IBOutlet weak var phoneNoLabel: UILabel!
    
    @IBOutlet weak var dateDaylabel: UILabel!
    
    @IBOutlet weak var timelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
