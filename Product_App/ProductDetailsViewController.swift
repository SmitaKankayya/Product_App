//
//  ProductDetailsViewController.swift
//  Product_App
//
//  Created by Smita Kankayya on 17/12/23.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameAndPrice: UILabel!
    
    var productContainer : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    func bindData(){
        self.productImage.image = productContainer?.productImage
        self.productNameAndPrice.text = productContainer!.productName + ("\nProduct Price : \(String(productContainer!.productPrice))")
    }
}
