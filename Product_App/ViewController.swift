//
//  ViewController.swift
//  Product_App
//
//  Created by Smita Kankayya on 16/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var productTableView: UITableView!
    var productCollectionImageArray = [ 
        UIImage (named: "iPhone15_Pro_Max"),
        UIImage (named: "macbook"),
        UIImage (named: "TV"),
        UIImage (named: "Camera")]
    
    var productTableImageArray = [
        UIImage (named: "Sofa"),
        UIImage (named: "wallArt"),
        UIImage (named: "CoffeeTable"),
        UIImage (named: "wallPainting")]
    
    var listOfProductCollectionView : [Product] = [Product(productImage: UIImage(imageLiteralResourceName : "iPhone15_Pro_Max"),productName: "Apple iPhone 15 Pro Max", productPrice: 156000),
                                                   Product(productImage: UIImage(imageLiteralResourceName : "macbook"),productName: "MacBook Air - Space Grey" , productPrice: 134900),
                                                   Product(productImage: UIImage(imageLiteralResourceName : "TV"),productName: "Sony Bravia TV", productPrice: 81990),
                                                   Product(productImage: UIImage(imageLiteralResourceName : "Camera"),productName: "Canon EOS Camera", productPrice: 46000)
                                                  ]

    var listOfProductTableView : [Product] = [Product(productImage: UIImage(imageLiteralResourceName : "Sofa"),productName: "Sofa Set", productPrice: 42000),
                                              Product(productImage: UIImage(imageLiteralResourceName : "wallArt"),productName: "Wall Art", productPrice: 6999),
                                              Product(productImage: UIImage(imageLiteralResourceName : "CoffeeTable"),productName: "Coffee Table", productPrice: 3100),
                                              Product(productImage: UIImage(imageLiteralResourceName : "wallPainting"),productName: "RadhaKrishna Wall Painting" , productPrice: 1899)
                                             ]
    
    var productTableViewCell : ProductTableViewCell?
    var productCollectionViewCell : ProductCollectionViewCell?
    
    var productDetailsViewController : ProductDetailsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeProductTableView()
        registerXIBWithProductTableView()
        initializeProductCollectionView()
        registerXIBWithProductCollectionView()
    }
    
    func initializeProductTableView(){
        productTableView.dataSource = self
        productTableView.delegate = self
    }
    
    func registerXIBWithProductTableView(){
        let uiNib = UINib(nibName:"ProductTableViewCell", bundle: nil)
        self.productTableView.register(uiNib, forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    func initializeProductCollectionView(){
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
    }
    
    func registerXIBWithProductCollectionView(){
        let uiNib1 = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        self.productCollectionView.register(uiNib1, forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
    
}

//MARK : UITableViewDataSource
extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfProductTableView.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        productTableViewCell = self.productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell
        productTableViewCell?.productImage2View.image = productTableImageArray[indexPath.row]
        return productTableViewCell!
    }
}

//MARK : UITableViewDelegate
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        productDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
        // productDetailsViewController!.productContainer =  productTableImageArray[indexPath.row]
        productDetailsViewController!.productContainer = listOfProductTableView[indexPath.row]
        navigationController?.pushViewController(productDetailsViewController!, animated: true)
    }
}

//MARK : UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listOfProductCollectionView.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCollectionViewCell = self.productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        productCollectionViewCell.productImageView.image = productCollectionImageArray[indexPath.row]
        return productCollectionViewCell
    }
}

//MARK : UICollectionViewDelegateFlowLayout
extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let spacebetweenTheCell : CGFloat = (flowLayout.minimumInteritemSpacing ?? 0.0) +
        (flowLayout.sectionInset.left ?? 0.0) +
        (flowLayout.sectionInset.right ?? 0.0)
        
        let size = (self.productCollectionView.frame.width - spacebetweenTheCell)/2.0
        return CGSize(width: size, height: size)
    }
}

//MARK : UICollectionViewDelegate
extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        productDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
        productDetailsViewController?.productContainer = listOfProductCollectionView[indexPath.row]
        navigationController?.pushViewController(productDetailsViewController!, animated: true)
    }
}
