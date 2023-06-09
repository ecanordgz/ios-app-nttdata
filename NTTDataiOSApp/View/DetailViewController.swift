//
//  DetailViewController.swift
//  NTTDataiOSApp
//
//  Created by Enrique Cano on 08/06/23.
//

import UIKit

class DetailViewController: UIViewController {
    var product: Product = Product()
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        if let urlString = product.thumbnail {
            if let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let responseData = data {
                        if let image = UIImage(data: responseData) {
                            DispatchQueue.main.async {
                                self.thumbnailImageView.image = image
                            }
                        }
                    }
                }.resume()
            }
        }
        
        self.titleLabel.text = self.product.title
        self.descriptionLabel.text = self.product.description
        self.priceLabel.text = self.product.price?.description
        self.stockLabel.text = self.product.stock?.description
        self.brandLabel.text = self.product.brand
        self.categoryLabel.text = self.product.category
    }
    
    @IBAction func returnTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
