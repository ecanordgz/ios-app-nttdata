//
//  ProductTableViewCell.swift
//  NTTDataiOSApp
//
//  Created by Enrique Cano on 08/06/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.borderWidth = 2
        self.containerView.layer.borderColor = UIColor.blue.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
