//
//  ContaCell.swift
//  beluga
//
//  Created by Luis Silva on 04/07/23.
//

import UIKit

class ContaCellAccount: UITableViewCell {

    var cell0name = UILabel()
    var cell0email = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cell0name)
        addSubview(cell0email)
        
        configurename()
        configureemail()
        
        setnameConstraints()
        setemailConstraints()
        
    }
    
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been imolemented")
    }
    
    func set(Cells: cellsAccount){
        cell0name.text = Cells.name
        cell0email.text = Cells.email
    }
    
    
    func configurename(){
        cell0name.clipsToBounds = true
        
    }
    func configureemail() {
        cell0email.clipsToBounds = true
    }
    
    func setnameConstraints() {
        cell0name.translatesAutoresizingMaskIntoConstraints = false
        cell0name.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -8).isActive = true
        cell0name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        cell0name.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    func setemailConstraints() {
        cell0email.translatesAutoresizingMaskIntoConstraints = false
        cell0email.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12).isActive = true
        cell0email.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        cell0email.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}

