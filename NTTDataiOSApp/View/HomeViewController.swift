//
//  ViewController.swift
//  NTTDataiOSApp
//
//  Created by Enrique Cano on 08/06/23.
//

import UIKit

class HomeViewController: UIViewController, ProductsViewUI {
    
    @IBOutlet weak var productsTableView: UITableView!
    
    var productsPresenter = ProductsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.productsTableView.dataSource = self
        self.productsTableView.delegate = self
        self.productsPresenter.delegate = self
        
        self.productsPresenter.getProducts()
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.productsTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productsPresenter.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellProduct = self.productsTableView.dequeueReusableCell(withIdentifier: "cellProduct", for: indexPath) as! ProductTableViewCell
        
        cellProduct.selectionStyle = .none
        
        cellProduct.titleLabel.text = self.productsPresenter.products[indexPath.row].title
        cellProduct.descriptionLabel.text = self.productsPresenter.products[indexPath.row].description
        cellProduct.priceLabel.text = self.productsPresenter.products[indexPath.row].price?.description
        
        return cellProduct
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        vc.product = self.productsPresenter.products[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

