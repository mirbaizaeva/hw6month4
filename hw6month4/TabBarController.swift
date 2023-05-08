//
//  TabBarController.swift
//  hw6month4
//
//  Created by Nurjamal Mirbaizaeva on 27/4/23.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViewControllers()
        tabBar.backgroundColor = .white
    }
    
    
    private func setupChildViewControllers() {
        let mainViewController = ViewController()
        let favouriteViewController = FavouriteViewController()
        
        let mainIcon = UIImage(systemName: "house.fill")
        let favouriteIcon = UIImage(systemName: "heart")
        
        viewControllers = [generateNavigatonController(rootViewController: mainViewController, image: mainIcon!), generateNavigatonController(rootViewController: favouriteViewController, image: favouriteIcon!)]
    }
    
    
    func generateNavigatonController(rootViewController: UIViewController, image: UIImage) -> UIViewController {
        let navigaionController = UINavigationController(rootViewController: rootViewController)
        navigaionController.tabBarItem.image = image
        return navigaionController
    }
    
}
