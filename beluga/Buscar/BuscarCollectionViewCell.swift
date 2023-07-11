//
//  BuscarCollectionViewCell.swift
//  ForneceMais
//
//  Created by Antonio Marcos on 10/07/23.
//

import UIKit

class BuscarCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var buscarImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(with categorias: Categorias) {
        buscarImageView.image = categorias.image
        titleLabel.text = categorias.title
    }
}
