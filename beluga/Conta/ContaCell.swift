//
//  ContaCell.swift
//  beluga
//
//  Created by Luis Silva on 04/07/23.
//

import UIKit

class ContaCell: UITableViewCell {

    var cell1image = UIImageView()
    var cell1title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        addSubview(cell1image)
        addSubview(cell1title)
        
        configureimage()
        configuretitle()
        
        setimageConstraints()
        settitleConstraints()
    }
    
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been imolemented")
    }
    
    
    func set(Cells: cells){
        cell1image.image = Cells.image
        cell1title.text = Cells.title
        
    }
    
    
    func configureimage(){
        cell1image.clipsToBounds = true
    }
    
    func configuretitle(){
        cell1title.numberOfLines = 0
        cell1title.adjustsFontSizeToFitWidth = true
    }
    
    
    func setimageConstraints() {
        cell1image.translatesAutoresizingMaskIntoConstraints = false
        cell1image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cell1image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        cell1image.heightAnchor.constraint(equalToConstant: 22).isActive = true
        cell1image.widthAnchor.constraint(equalTo: cell1image.heightAnchor, multiplier: 1).isActive = true
    }
    
    func settitleConstraints() {
        cell1title.translatesAutoresizingMaskIntoConstraints = false
        cell1title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cell1title.leadingAnchor.constraint(equalTo: cell1image.trailingAnchor, constant: 16).isActive = true
        cell1title.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cell1title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
        
        accessoryType = .disclosureIndicator
    }
}

