//
//  CardViewController.swift
//  beluga
//
//  Created by Renan Tavares on 04/07/23.
//

import UIKit
import CoreData

class CardViewController: UIViewController {
    
    
    @IBOutlet weak var listCardTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var fornecedorGlobal = [Fornecedor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Explorar"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Fornecedor")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
            do {
              try context.execute(deleteRequest)
            } catch let error as NSError {
              // TODO: handle the error
            }
        
        
        for fornecedor in AppDelegate.ListaDeFornecedores {
            let novoFornecedor = Fornecedor(context: context)
            novoFornecedor.nome = fornecedor["nome"]
            novoFornecedor.nicho = fornecedor["nicho"]
            novoFornecedor.imagem = fornecedor["imagem"]
            novoFornecedor.telefone = fornecedor["telefone"]
            novoFornecedor.endereco = fornecedor["endereco"]
            novoFornecedor.sobre = fornecedor["sobre"]
            novoFornecedor.salva = false
            if !novoFornecedor.isInserted {
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
            
            
        }
        
        fornecedorGlobal = fetchFornecedores()
        
    }
    
    
    public func fetchFornecedores() -> [Fornecedor] {
        //Fetch the data from Core Data to display in the tableView
        do {
            let request = Fornecedor.fetchRequest() as NSFetchRequest<Fornecedor>
            let fornecedor = try context.fetch(request)
            return fornecedor
        }
        catch {
            return []
        }
    }
    
    private func setupTableView(){
        listCardTableView.dataSource = self
        listCardTableView.delegate = self
        listCardTableView.register(UINib(nibName: "FornecedorTableViewCell", bundle: nil), forCellReuseIdentifier: "FornecedorTableViewCell")
        listCardTableView.register(UINib(nibName: "SubTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "SubTitleTableViewCell")
        listCardTableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
       
    }
    
    
    
}

extension CardViewController:   UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 10
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorColor = .clear
        
        if indexPath.section == 0 {
            //print(indexPath)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FornecedorTableViewCell", for: indexPath) as? FornecedorTableViewCell else {
                fatalError()
            }
            
//            let fornecedor = self.items![0]
//            print(fornecedor.nome ?? 0)
            cell.initData(fornecedores: fornecedorGlobal)
            
            return cell
        } else if indexPath.section == 1 {
            guard let labelCell = tableView.dequeueReusableCell(withIdentifier: "SubTitleTableViewCell", for: indexPath) as? SubTitleTableViewCell else {
                fatalError()
            }
            return labelCell
        }else {
            print(indexPath)
            guard let cellCostumized = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as? SecondTableViewCell else {
                fatalError()
            }
            cellCostumized.fornecedorNameTableCell.text = fornecedorGlobal[indexPath.row].nome
            cellCostumized.nichoCardTableCell.text = fornecedorGlobal[indexPath.row].nicho
            cellCostumized.imageCardTableCell.image = UIImage(named: fornecedorGlobal[indexPath.row].imagem!)
            if fornecedorGlobal[indexPath.row].salva {
                cellCostumized.saveButton.configuration?.image = UIImage(systemName: "bookmark.fill")
            } else {
                cellCostumized.saveButton.configuration?.image = UIImage(systemName: "bookmark")
            }
            return cellCostumized
        }
        
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 1 {
//            return 25
//        } else {
//            return 0
//        }
//    }
//
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 1 {
//            return UIView()
//        }
//        return nil
//    }
//
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           let spacing: CGFloat = 10 // Defina o valor do espaçamento desejado
           cell.contentView.layoutMargins = UIEdgeInsets(top: 100, left: spacing, bottom: 0, right: spacing)
           cell.contentView.backgroundColor = .clear
           cell.backgroundColor = .clear
       }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            if indexPath.row < 10 && indexPath.row > -1 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "cardFornecedor") as? ViewControllerFornecedor {
                    
                    vc.n = indexPath.row
                    vc.fornecedorGlobal = fornecedorGlobal
                    
                    self.present(vc, animated: true)
                    
                }
            }
        }
    }
    
}
