//
//  theCell.swift
//  MapProject
//
//  Created by Jason Scott on 1/19/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//

import UIKit

class theCell: UITableViewCell {
    
    ///Setting up outlets for incoming data
    
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
