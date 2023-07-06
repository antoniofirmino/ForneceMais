//
//  CardViewController.swift
//  beluga
//
//  Created by Renan Tavares on 04/07/23.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var listCardTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        title = "Explorar"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
//        let border = CALayer()
//        border.backgroundColor = UIColor.lightGray.cgColor
//        border.frame = CGRect(x: 0, y: viewHeader.frame.size.height, width: viewHeader.frame.size.width, height: 1)
//        viewHeader.layer.addSublayer(border)
//        
//        view.addSubview(viewHeader)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    private func setupTableView(){
        listCardTableView.dataSource = self
        listCardTableView.delegate = self
        listCardTableView.register(UINib(nibName: "FornecedorTableViewCell", bundle: nil), forCellReuseIdentifier: "FornecedorTableViewCell")
        listCardTableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
    }
    
    
    
    
}


extension CardViewController:   UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 10
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorColor = .clear
        
        if indexPath.section == 0 {
            print(indexPath)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FornecedorTableViewCell", for: indexPath) as? FornecedorTableViewCell else {
                fatalError()
            }
            return cell
        } else {
            print(indexPath)
            guard let cellCostumized = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as? SecondTableViewCell else {
                fatalError()
            }
            return cellCostumized
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 40
        } else {
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            return UIView() // Retorne uma UIView vazia para criar o espaçamento visualmente
        }
        return nil
    }
    
    
}
