//
//  CustomCellNames.swift
//  RoletaRussa
//
//  Created by user208023 on 7/7/22.
//

import UIKit

class CustomCellNames: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(value: Person) {
        self.profileImageView.image = UIImage(named: value.ImageId)
        self.nameLabel.text = value.name
    }
    
}
