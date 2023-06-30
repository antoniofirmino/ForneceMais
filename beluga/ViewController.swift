//
//  ViewController.swift
//  beluga
//
//  Created by Antonio Marcos on 29/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewHeader: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let border = CALayer()
        border.backgroundColor = UIColor.blue.cgColor
        border.frame = CGRect(x: 0, y: viewHeader.frame.size.height - 1, width: viewHeader.frame.size.width, height: 1)
        viewHeader.layer.addSublayer(border)
        
        view.addSubview(viewHeader)
    }
    
    


}


