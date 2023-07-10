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
        
        //primeira view, explorar
        let myViewController = CardViewController(nibName: "CardViewController", bundle: nil)
        myViewController.tabBarItem.image = UIImage(systemName: "doc.text.image")
        myViewController.tabBarItem.selectedImage = UIImage(systemName: "doc.text.image.fill")?.withTintColor(.blue)
        let vc0 = UINavigationController(rootViewController: myViewController)
        vc0.title = "Explorar"
        self.present(vc0, animated: true, completion: nil)
        
        
        //terceira view, conta
        let vc2 = UINavigationController(rootViewController: ViewControllerConta())
        vc2.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.blue)
        vc2.title = "Conta"
        self.present(vc2, animated: true, completion: nil)
        
        
        //segunda view, buscas
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let story = storyboard.instantiateViewController(withIdentifier: "buscar")
        let vc1 = UINavigationController(rootViewController: story)
        vc1.title = "Buscar"
        self.present(vc1, animated: true, completion: nil)
        vc1.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.fill")?.withTintColor(.blue)
       
        
        
        
        
        
        setViewControllers([vc0,vc1, vc2], animated: true)
        
        
        
        
        
        
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
