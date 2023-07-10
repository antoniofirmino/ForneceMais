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
        TableViewFornecedores.delegate = self
        TableViewFornecedores.register(UINib(nibName: "CelulaFornecedoresTableViewCell", bundle: nil), forCellReuseIdentifier: "CelulaFornecedoresTableViewCell")
        
    }



}

extension ListaFornecedoresViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Fornecedores.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CelulaFornecedoresTableViewCell", for: indexPath) as? CelulaFornecedoresTableViewCell
        else {
            fatalError()
        }
        cell.initData(Nome: Fornecedores[indexPath.row]["name"]!  , Nicho: Fornecedores[indexPath.row]["nicho"]!, Imagem: UIImage(named : Fornecedores[indexPath.row]["image"]!)!)
        return cell
    }

}


let Fornecedores = [
    [
        "name": "Ricardo",
        "nicho":"Bebidas",
        "image": "Frutas"
    ],
    
    [
        "name": "Joao",
        "nicho":"Comida",
        "image": "Frutas"
    ],
    
    [
        "name": "Renan",
        "nicho":"Peças",
        "image": "Frutas"
    ]
]
