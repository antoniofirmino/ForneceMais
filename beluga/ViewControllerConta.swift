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
    var label: UIImage
}
struct cellsLog{
    var label2: String
}

class ViewControllerConta: UIViewController {

    var tableView = UITableView(frame: .zero, style: .insetGrouped)
    var cell: [cells] = []
    var cellLog: [cellsLog] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Conta"
        cell = fecthData()
        cellLog = fecthData2()
        configureTableView()
        configureTableView2()
        }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 44
        tableView.register(ContaCell.self, forCellReuseIdentifier: "ContaCell")
        tableView.pin(to:view)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func configureTableView2() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 44
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
        return 2
    }
    //essa primeira funcao deve retornar o numero de celulas que ela vai mostrar, number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return cell.count
        } else {
            return cellLog.count
        }
        
    }
    
    //e aqui retorna quais celulas voce vai querrer mostrar
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let ce = tableView.dequeueReusableCell(withIdentifier: "ContaCell") as! ContaCell
            let cellll = cell[indexPath.row]
            ce.set(Cells: cellll)
            return ce
        } else {
            let ce2 = tableView.dequeueReusableCell(withIdentifier: "ContaCellLog") as! ContaCellLog
            let cellll2 = cellLog[indexPath.row]
            ce2.set(Cells: cellll2)
            //print(ce2.cell2label.text!)
            if ce2.cell2label.text == "Finalizar sessão" {
                ce2.cell2label.textColor = .blue
            } else if ce2.cell2label.text == "Deletar conta"{
                ce2.cell2label.textColor = .red
            }
            return ce2
        }
    }
    
}

//deixa a tela mais limpa
extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

extension ViewControllerConta {
    
    func fecthData() -> [cells]{
        let c1 = cells(image: UIImage(systemName: "bookmark.fill")!, title: "Fornecedores salvos", label: UIImage(systemName: "chevron.right")!)
        let c2 = cells(image: UIImage(systemName: "bubble.left")!, title: "Comentários feitos", label: UIImage(systemName: "chevron.right")!)
        let c3 = cells(image: UIImage(systemName: "bell.badge")!, title: "Notificações", label: UIImage(systemName: "chevron.right")!)
        
        return [c1, c2, c3]
    }
    
    func fecthData2() ->  [cellsLog]{
        let c11 = cellsLog(label2: "Finalizar sessão")
        let c22 = cellsLog(label2: "Deletar conta")
    
        return [c11, c22]
    }
}



