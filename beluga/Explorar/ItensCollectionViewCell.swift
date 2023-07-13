//
//  ItensCollectionViewCell.swift
//  beluga
//
//  Created by Renan Tavares on 04/07/23.
//

import UIKit
import CoreData

class ItensCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nichoCollectionCell: UILabel!
    @IBOutlet weak var starsCollectionCell: UIImageView!
    @IBOutlet weak var forncedorNameCollectionCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nichoCollectionCell.text = "Alimentação"
        starsCollectionCell.image = UIImage(named: "Frame 21")
        forncedorNameCollectionCell.text = "Fornecedor 1"
        cardView.layer.cornerRadius = 14
        cardView.clipsToBounds = true
        saveButton.addTarget(self, action: #selector(storeDataFornecedor), for: .touchUpInside)
    }
    
    @IBAction func storeDataFornecedor(_ sender: UIButton) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            guard let nome = forncedorNameCollectionCell?.text else {
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
