//
//  MainController.swift
//  hw6month4
//
//  Created by Nurjamal Mirbaizaeva on 27/4/23.
//

import Foundation

class MainController {
    private weak var view: ViewController!
    
    private var model: MainModel?
    
    init(view: ViewController) {
        self.view = view
        self.model = MainModel(controller: self)
    }
    
    func fetchProducts() {
        model?.fetchProducts()
    }
    
    func getProducts() -> [Product] {
        let products = model?.getProducts()
        return products ?? []
    }
    
    func collectionViewReloaded() {
        view.reloadProductsCollectionView()
    }
    func findProducts(searchText: String){
            model?.findProducts(searchText: searchText)
        }
    }
//    func dataToSave(index: Int){
//        model?.saveProduct(by: index)
//    }
//    func dataToDelete(index: Int){
//        model?.deleteProduct(by: index)
//    }
//}
