//
//  MainModel.swift
//  hw6month4
//
//  Created by Nurjamal Mirbaizaeva on 27/4/23.
//

import Foundation

struct ProductResponse: Codable {
    var products: [Product]
}

struct Product: Codable {
    var id: Int
    var title: String
    var description: String
    var price: Int
    var thumbnail: String
}

class MainModel {
    var isFiltering = true

    private weak var controller: MainController!
    
    private var networkManager = NetworkManager()
    
    private var products: [Product] = []
    private var filteredProducts: [Product] = []
    
//    private var userDefaults = UserDefaults.standard
//    private var productsToSave: [Product] = []
    
    init(controller: MainController) {
        self.controller = controller
    }
    
    func fetchProducts() {
        networkManager.fetchProducts { result in
            self.products = result.products
            self.controller.collectionViewReloaded()
        }
    }
    
    func getProducts() -> [Product] {
        return products
    }
    func findProducts(searchText: String){
            if searchText.isEmpty{
            }else{
                isFiltering = true
                filteredProducts = products.filter({ $0.title.lowercased().contains(searchText.lowercased())})
            }
            controller.collectionViewReloaded()
        }
    }
//    func saveProduct(by index: Int){
//        let product = products[index]
//        getPreviousFavourites()
//        productsToSave.append(product)
//
//        let encodedProducts = try? JSONEncoder().encode(productsToSave)
//
//        userDefaults.set(encodedProducts, forKey: "favorites")
//    }
//    func getPreviousFavourites(){
//        if let favourites = userDefaults.object(forKey: "favorites") as? Data {
//            let savedFavourites = try? JSONDecoder().decode([Product].self, from: favourites)
//            productsToSave = savedFavourites!
//        }
//    }
//    func deleteProduct(by index: Int){
//        getPreviousFavourites()
//        productsToSave.remove(at: index)
//    }
//}
