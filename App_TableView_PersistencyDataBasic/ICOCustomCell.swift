//
//  ICOCustomCell.swift
//  App_TableView_PersistencyDataBasic
//
//  Created by User on 16/1/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit

class ICOCustomCell: UITableViewCell {
    
    
    @IBOutlet weak var myTask: UILabel!
    @IBOutlet weak var myPriority: UILabel!
    @IBOutlet weak var myDescription: UITextView!
    @IBOutlet weak var myCategory: UILabel!
    @IBOutlet weak var myCustomImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        myCustomImageView.layer.cornerRadius = myCustomImageView.frame.size.width/2
        myCustomImageView.clipsToBounds = true
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
