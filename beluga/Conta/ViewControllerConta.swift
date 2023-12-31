//
//  ViewControllerConta.swift
//  beluga
//
//  Created by Luis Silva on 03/07/23.
//

import UIKit

struct cells{
    var image: UIImage
    var title: String
}
struct cellsLog{
    var label2: String
}
struct cellsAccount{
    var name: String
    var email: String
}

class ViewControllerConta: UIViewController {

    var tableView = UITableView(frame: .zero, style: .insetGrouped)
    var cell: [cells] = []
    var cellLog: [cellsLog] = []
    var cellAccount: [cellsAccount] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Conta"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        cellAccount = fecthData0()
        cell = fecthData()
        cellLog = fecthData2()
        
        view.addSubview(tableView)
        setTableViewDelegates()
        
        configureTableView0()
        configureTableView()
        configureTableView2()
        }
    
    func configureTableView0() {
        tableView.register(ContaCellAccount.self, forCellReuseIdentifier: "ContaCellAccount")
        tableView.pin(to:view)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func configureTableView() {
        tableView.register(ContaCell.self, forCellReuseIdentifier: "ContaCell")
        tableView.pin(to:view)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func configureTableView2() {
        tableView.register(ContaCellLog.self, forCellReuseIdentifier: "ContaCellLog")
        tableView.pin(to:view)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
}


extension ViewControllerConta: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    //essa primeira funcao deve retornar o numero de celulas que ela vai mostrar, number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return cellAccount.count
        } else if section == 1 {
            return cell.count
        } else {
            return cellLog.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 54
        } else if indexPath.section == 1 {
            return 44
        } else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return -32
    }
    
    //e aqui retorna quais celulas voce vai querrer mostrar
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let ce0 = tableView.dequeueReusableCell(withIdentifier: "ContaCellAccount") as! ContaCellAccount
            let cellll0 = cellAccount[indexPath.row]
            ce0.set(Cells: cellll0)
            ce0.cell0email.font = UIFont.systemFont(ofSize: 12)
            return ce0
        }
        else if indexPath.section == 1 {
            let ce = tableView.dequeueReusableCell(withIdentifier: "ContaCell") as! ContaCell
            let cellll = cell[indexPath.row]
            ce.set(Cells: cellll)
            return ce
        }
        else {
            let ce2 = tableView.dequeueReusableCell(withIdentifier: "ContaCellLog") as! ContaCellLog
            let cellll2 = cellLog[indexPath.row]
            ce2.set(Cells: cellll2)
            if ce2.cell2label.text == "Finalizar sessão" {
                ce2.cell2label.textColor = UIColor(red: 52/255, green: 120/255, blue: 246/255, alpha: 1.0)
            } else if ce2.cell2label.text == "Deletar conta"{
                ce2.cell2label.textColor = .red
            }
            return ce2
        }
    }
    
    //pra pegar onde o usuario clicou
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                
                tableView.deselectRow(at: indexPath, animated: true)
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let myViewController = ListaFornecedoresViewController(nibName: "ListaFornecedoresViewController", bundle: nil)
                navigationController?.pushViewController(myViewController, animated: true)
                tableView.deselectRow(at: indexPath, animated: true)
            }
            else if indexPath.row == 1 {
                print("2")
                tableView.deselectRow(at: indexPath, animated: true)
            } else if indexPath.row == 2 {
                print("3")
                tableView.deselectRow(at: indexPath, animated: true)
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                print("4")
                tableView.deselectRow(at: indexPath, animated: true)
            }
            else if indexPath.row == 1 {
                print("5")
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
}

//deixa a tela mais limpa
extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: -4).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 4).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

extension ViewControllerConta {
    
    func fecthData0() ->  [cellsAccount]{
        let c0 = cellsAccount(name: "Antonio Marcos", email: "antonio@gmail.com")
        return [c0]
    }
    func fecthData() -> [cells]{
        let c1 = cells(image: UIImage(systemName: "bookmark.fill")!, title: "Fornecedores salvos")
        let c2 = cells(image: UIImage(systemName: "bubble.left")!, title: "Comentários feitos")
        let c3 = cells(image: UIImage(systemName: "bell.badge")!, title: "Notificações")
        
        return [c1, c2, c3]
    }
    
    func fecthData2() ->  [cellsLog]{
        let c11 = cellsLog(label2: "Finalizar sessão")
        let c22 = cellsLog(label2: "Deletar conta")
    
        return [c11, c22]
    }
    
}



