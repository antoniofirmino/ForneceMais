//
//  FornecedorTableViewCell.swift
//  beluga
//
//  Created by Renan Tavares on 04/07/23.
//

import UIKit

class FornecedorTableViewCell: UITableViewCell {
    
    //    @IBOutlet weak var iconView: UIView!
    //    @IBOutlet weak var nameLabel: UILabel!
    //    @IBOutlet weak var myImageView: UIImageView!
    var listaFornecedores: [Fornecedor] = []
    
    
    @IBOutlet weak var collectionViewControllerOfTableCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
        // Initialization code
        collectionViewControllerOfTableCell.showsHorizontalScrollIndicator = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setupTableView(){
        collectionViewControllerOfTableCell.dataSource = self
        collectionViewControllerOfTableCell.delegate = self
        collectionViewControllerOfTableCell.register(UINib(nibName: "ItensCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItensCollectionViewCell")
    }
    
  
}


extension FornecedorTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItensCollectionViewCell", for: indexPath) as? ItensCollectionViewCell else {
            fatalError()
        }
        countryCell.forncedorNameCollectionCell.text = listaFornecedores[indexPath.row].nome
        countryCell.starsCollectionCell.image = UIImage(named: listaFornecedores[indexPath.row].estrelas!)
        countryCell.nichoCollectionCell.text = listaFornecedores[indexPath.row].nicho
        countryCell.imagemDestaque.image = UIImage(named: listaFornecedores[indexPath.row].imagem!)
        return countryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
       }

    func initData(fornecedores: [Fornecedor]) {
        listaFornecedores = fornecedores
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row < 3 && indexPath.row > -1 {
                CardViewController().chamarView(indexPath.row, fornec: listaFornecedores)
                }
            }
        }
    }


