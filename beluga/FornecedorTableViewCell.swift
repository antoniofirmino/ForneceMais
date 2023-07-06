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
        collectionViewControllerOfTableCell.register(UINib(nibName: "ItensCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItensCollectionViewCell")
    }
    
}


extension FornecedorTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItensCollectionViewCell", for: indexPath) as? ItensCollectionViewCell else {
            fatalError()
        }
        
        return countryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.isDragging {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        }
    }
    

}

