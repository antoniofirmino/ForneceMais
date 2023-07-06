//
//  ContaCell.swift
//  beluga
//
//  Created by Luis Silva on 04/07/23.
//

import UIKit

class ContaCellLog: UITableViewCell {

    var cell2label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cell2label)
        
        configurelabel2()
        
        setlabel2Constraints()
        
    }
    
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been imolemented")
    }
    
    func set(Cells: cellsLog){
        cell2label.text = Cells.label2
    }
    
    
    func configurelabel2(){
        cell2label.clipsToBounds = true
        
    }
    
    func setlabel2Constraints() {
        cell2label.translatesAutoresizingMaskIntoConstraints = false
        cell2label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cell2label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        cell2label.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}

