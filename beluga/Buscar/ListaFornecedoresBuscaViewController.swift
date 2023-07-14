//
//  ListaFornecedoresBuscaViewController.swift
//  beluga
//
//  Created by Ricardo de Agostini Neto on 05/07/23.
//

import UIKit
import CoreData

class ListaFornecedoresBuscaViewController: UIViewController {
    var getFornecedor = [Fornecedor]()
    var categoria: String? = nil
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var TableViewFornecedores: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = categoria ?? "Busca"
        navigationItem.largeTitleDisplayMode = .never
        
        do {
            let request = Fornecedor.fetchRequest() as NSFetchRequest<Fornecedor>
            
            if let nicho = categoria {
                request.predicate = NSPredicate(format: "nicho == %@", nicho)
            }
            
            getFornecedor = try context.fetch(request)
            
            
        } catch {
            fatalError()
        }
        
    }
    private func setupTableView() {
        TableViewFornecedores.dataSource = self
        TableViewFornecedores.delegate = self
        TableViewFornecedores.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
        
    }
}

extension ListaFornecedoresBuscaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getFornecedor.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as? SecondTableViewCell
        else {
            fatalError()
        }
        //cell.initData(Nome: getFornecedor[indexPath.row].nome!  , Nicho: getFornecedor[indexPath.row].nicho!, Imagem: UIImage(named : "alimentos")!)
        
        cell.fornecedorNameTableCell.text = getFornecedor[indexPath.row].nome
        cell.nichoCardTableCell.text = getFornecedor[indexPath.row].nicho
        cell.imageCardTableCell.image = UIImage(named: getFornecedor[indexPath.row].imagem!)
        if getFornecedor[indexPath.row].salva {
            cell.saveButton.configuration?.image = UIImage(systemName: "bookmark.fill")
        } else {
            cell.saveButton.configuration?.image = UIImage(systemName: "bookmark")
        }

        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row < getFornecedor.count && indexPath.row > -1 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "cardFornecedor") as? ViewControllerFornecedor {
                    
                    vc.n = indexPath.row
                    vc.fornecedorGlobal = getFornecedor
                    
                    self.present(vc, animated: true)
                    
                }
            }
        }
    }

}
