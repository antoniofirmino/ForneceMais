//
//  SecondTableViewCell.swift
//  beluga
//
//  Created by Renan Tavares on 06/07/23.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var nichoCardTableCell: UILabel!
    @IBOutlet weak var cardStarsTableCell: UIImageView!
    @IBOutlet weak var fornecedorNameTableCell: UILabel!
    @IBOutlet weak var imageCardTableCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        nichoCardTableCell.text = "alimentação"
        cardStarsTableCell.image = UIImage(named: "Frame 21")
        fornecedorNameTableCell.text = "Fornecedor 1"
        imageCardTableCell.image = UIImage(named: "Frutas")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
 
    
}
