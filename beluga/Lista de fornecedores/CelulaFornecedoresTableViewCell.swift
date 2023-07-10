//
//  CelulaFornecedoresTableViewCell.swift
//  beluga
//
//  Created by Ricardo de Agostini Neto on 05/07/23.
//

import UIKit

class CelulaFornecedoresTableViewCell: UITableViewCell {
        @IBOutlet weak var ligNome: UILabel!
        @IBOutlet weak var ligNicho: UILabel!
        @IBOutlet weak var ligImagem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initData(Nome: String , Nicho: String , Imagem : UIImage) {
        ligNome.text = Nome
        ligNicho.text = Nicho
        ligImagem.image = Imagem
    }
}





class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x: 100, y: 100, width: 120, height: 240)
        let newView = CelulaFornecedoresTableViewCell(frame: rect)
        self.view.addSubview(newView)
    }
    
}
