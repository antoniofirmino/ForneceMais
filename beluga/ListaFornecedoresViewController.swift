//
//  ListaFornecedoresViewController.swift
//  beluga
//
//  Created by Ricardo de Agostini Neto on 05/07/23.
//

import UIKit

class ListaFornecedoresViewController: UIViewController {

    @IBOutlet weak var TableViewFornecedores: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    private func setupTableView() {
        TableViewFornecedores.dataSource = self
        TableViewFornecedores.register(UINib(nibName: "CelulaFornecedoresTableViewCell", bundle: nil), forCellReuseIdentifier: "CelulaFornecedoresTableViewCell")
        
    }



}

extension ListaFornecedoresViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CelulaFornecedoresTableViewCell", for: indexPath) as? CelulaFornecedoresTableViewCell
        else {
            fatalError()
        }
//        cell.ligacao1.text = "Fornecedor"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row > -1 && indexPath.row < 10{
                let next = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "cardFornecedor")
                self.navigationController?.present(next, animated: true)
            }
        }
    }

}
