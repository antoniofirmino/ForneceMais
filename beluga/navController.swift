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
        
        let myViewController = CardViewController(nibName: "CardViewController", bundle: nil)
        myViewController.tabBarItem.image = UIImage(systemName: "doc.text.image")
        myViewController.tabBarItem.selectedImage = UIImage(systemName: "doc.text.image")?.withTintColor(.blue)
        let navigationController = UINavigationController(rootViewController: myViewController)
        self.present(navigationController, animated: true, completion: nil)
        
        let vc1 = UINavigationController(rootViewController: ViewControllerConta())
        
        vc1.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle")?.withTintColor(.blue)
        
        //_ = UINavigationController(rootViewController: ViewControllerFornecedor())
        
        
        
        
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "buscar")
        self.present(vc, animated: true)
        vc.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass")?.withTintColor(.blue)
        
        
        
        
        
        
        
        setViewControllers([navigationController,vc, vc1], animated: true)
        
        
        
        
        
        
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
