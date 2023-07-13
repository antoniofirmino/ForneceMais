//
//  SecondTableViewCell.swift
//  beluga
//
//  Created by Renan Tavares on 06/07/23.
//

import UIKit
import CoreData

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var nichoCardTableCell: UILabel!
    @IBOutlet weak var cardStarsTableCell: UIImageView!
    @IBOutlet weak var fornecedorNameTableCell: UILabel!
    @IBOutlet weak var imageCardTableCell: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        nichoCardTableCell.text = "alimentação"
        cardStarsTableCell.image = UIImage(named: "Frame 21")
        fornecedorNameTableCell.text = "Fornecedor 1"
        imageCardTableCell.image = UIImage(named: "Frutas")
        imageCardTableCell.layer.cornerRadius = 14
        cardView.layer.cornerRadius = 14
        cardView.clipsToBounds = true
        saveButton.addTarget(self, action: #selector(storeDataFornecedor), for: .touchUpInside)
        
       
        
        
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

        // Configure the view for the selected state
    }
    
    
    @IBAction func storeDataFornecedor(_ sender: UIButton) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            guard let nome = fornecedorNameTableCell?.text else {
                return
            }
            let request = Fornecedor.fetchRequest() as NSFetchRequest<Fornecedor>
            request.predicate = NSPredicate(format: "nome == %@", nome )
            let listFornecedor = try managedContext.fetch(request)
            
            let fornecedor = listFornecedor[0]
            print(listFornecedor)

            print(fornecedor.salva)
            fornecedor.salva.toggle()
            
            if fornecedor.salva {
                saveButton.configuration?.image = UIImage(systemName: "bookmark.fill")
            } else {
                saveButton.configuration?.image = UIImage(systemName: "bookmark")
            }
            
            
        }
        catch {
            
        }
        
        appDelegate.saveContext()
        
    }
    
    
 
    
}
