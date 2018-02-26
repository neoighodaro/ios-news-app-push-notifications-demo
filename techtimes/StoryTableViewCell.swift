//
//  StoryTableViewCell.swift
//  
//
//  Created by Neo Ighodaro on 26/02/2018.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyContent: UILabel!
    @IBOutlet weak var featuredImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
