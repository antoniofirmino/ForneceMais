//
//  ViewControllerFornecedor.swift
//  beluga
//
//  Created by João Vitor Gonçalves Oliveira on 04/07/23.
//

import UIKit
import CoreData

class ViewControllerFornecedor: UIViewController {
   
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var telefone: UIButton!
    
    @IBOutlet weak var nomeFornecedor: UILabel!
    
    @IBOutlet weak var endereco: UIButton!
    
    @IBOutlet weak var sobre: UILabel!
    
    var fornecedorGlobal = [Fornecedor]()
    var n: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        card.layer.cornerRadius = 14
        
        nomeFornecedor.text = fornecedorGlobal[n].nome
        telefone.setTitle(fornecedorGlobal[n].telefone, for: .normal)
        endereco.setTitle(fornecedorGlobal[n].endereco, for: .normal)
        sobre.text = fornecedorGlobal[n].sobre
        
        
        
        // Do any additional setup after loading the view.
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
