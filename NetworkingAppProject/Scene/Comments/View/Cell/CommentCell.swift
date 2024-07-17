//
//  CommentCell.swift
//  NetworkingAppProject
//
//  Created by Lala on 14.07.24.
//

import UIKit

class CommentCell: UITableViewCell {
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
