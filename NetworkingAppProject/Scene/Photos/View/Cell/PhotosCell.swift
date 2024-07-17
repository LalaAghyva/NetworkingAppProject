//
//  PhotosCell.swift
//  NetworkingAppProject
//
//  Created by Lala on 13.07.24.
//

import UIKit

class PhotosCell: UITableViewCell {

    @IBOutlet weak var photosImageView: UIImageView!
    @IBOutlet weak var photosLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
