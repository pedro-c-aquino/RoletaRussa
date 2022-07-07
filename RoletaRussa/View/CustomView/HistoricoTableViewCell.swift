//
//  HistoricoTableViewCell.swift
//  RoletaRussa
//
//  Created by user208023 on 7/7/22.
//

import UIKit

class HistoricoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(value: Product?, imageType: String) {
        
        if value != nil {
            self.quantityLabel.text = "\(value!.quantity)"
            self.itemLabel.text = value?.name
            self.priceLabel.text = String(format: "%.2f", value!.price)
            self.imageItem.image = UIImage(named: imageType)
        }
    }
    
}
