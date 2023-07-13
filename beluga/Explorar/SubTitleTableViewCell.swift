//
//  SubTitleTableViewCell.swift
//  ForneceMais
//
//  Created by Renan Tavares on 11/07/23.
//

import UIKit

class SubTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var subTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        subTitle.text = "Mais acessados"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
