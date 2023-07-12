//
//  categorias.swift
//  ForneceMais
//
//  Created by Antonio Marcos on 10/07/23.
//

import UIKit

struct Categorias {
    let title: String
    let image: UIImage
}

let categorias: [Categorias] = [
    Categorias(title: "Alimentos", image: UIImage.init(named: "alimentos")!),
    Categorias(title: "Calçados", image: UIImage.init(named: "calcados")!),
    Categorias(title: "Cozinha", image: UIImage.init(named: "cozinha")!),
    Categorias(title: "Eletrônicos", image: UIImage.init(named: "eletronicos")!),
    Categorias(title: "Roupas", image: UIImage.init(named: "roupas")!),
    Categorias(title: "Semijoias", image: UIImage.init(named: "semijoias")!)
]
