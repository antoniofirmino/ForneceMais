//
//  navController.swift
//  beluga
//
//  Created by Luis Silva on 05/07/23.
//

import UIKit

class navController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: ViewControllerConta())
        
        vc1.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle")?.withTintColor(.blue)
        
        let vc2 = UINavigationController(rootViewController: ViewControllerFornecedor())
        
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass")?.withTintColor(.blue)
        
        setViewControllers([vc1, vc2], animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
