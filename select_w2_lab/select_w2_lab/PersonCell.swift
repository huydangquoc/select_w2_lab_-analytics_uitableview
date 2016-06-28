//
//  PersonCell.swift
//  select_w2_lab
//
//  Created by Dang Quoc Huy on 6/28/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import UIKit
import AFNetworking

class PersonCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var person: Person? {
        didSet {
            nameLabel.text = person?.name
            birthdateLabel.text = person?.birthdate
            heightLabel.text = "\((person?.height)!) cm"
            avatarImageView.setImageWithURL((person?.avatarImageURL)!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
