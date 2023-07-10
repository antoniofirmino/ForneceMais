//
//  ViewController.swift
//  beluga
//
//  Created by Luis Silva on 03/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buscaCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        buscaCollectionView.dataSource = self
        buscaCollectionView.delegate = self
        buscaCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorias.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuscarCollectionViewCell", for: indexPath) as! BuscarCollectionViewCell
        cell.setup(with: categorias[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 172, height: 106)
    }
}
