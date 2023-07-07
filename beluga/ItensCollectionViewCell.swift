//
//  ItensCollectionViewCell.swift
//  beluga
//
//  Created by Renan Tavares on 04/07/23.
//

import UIKit

class ItensCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nichoCollectionCell: UILabel!
    @IBOutlet weak var starsCollectionCell: UIImageView!
    @IBOutlet weak var forncedorNameCollectionCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nichoCollectionCell.text = "alimentação"
        starsCollectionCell.image = UIImage(named: "Frame 21")
        forncedorNameCollectionCell.text = "Fornecedor 1"
        cardView.layer.cornerRadius = 14
        cardView.clipsToBounds = true
    }
    
}
