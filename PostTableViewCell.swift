//
//  PostTableViewCell.swift
//  AlamofireDemo
//
//  Created by Mac on 23/10/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var PostUserId: UILabel!
    @IBOutlet weak var PostId: UILabel!
    @IBOutlet weak var PostTitle: UILabel!
    @IBOutlet weak var PostBody: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
