//
//   SearchViewController.swift
//  beluga
//
//  Created by Luis Silva on 03/07/23.
//

import UIKit

class  SearchViewController: UIViewController {

    @IBOutlet weak var searchBarView: UISearchBar!
    @IBOutlet weak var buscaCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Busca"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchBarView.delegate = self
        buscaCollectionView.dataSource = self
        buscaCollectionView.delegate = self
        buscaCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
}

extension  SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorias.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuscarCollectionViewCell", for: indexPath) as! BuscarCollectionViewCell
        cell.setup(with: categorias[indexPath.row])
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
        
        let myViewController = ListaFornecedoresBuscaViewController(nibName: "ListaFornecedoresBuscaViewController", bundle: nil)
        myViewController.textoBusca = searchBar.text
        navigationController?.pushViewController(myViewController, animated: true)
        
        searchBar.text = ""
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
    }
}

extension  SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 172, height: 106)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let myViewController = ListaFornecedoresBuscaViewController(nibName: "ListaFornecedoresBuscaViewController", bundle: nil)
                myViewController.categoria = "Alimentos"
                navigationController?.pushViewController(myViewController, animated: true)
            }
            if indexPath.row == 1 {
                let myViewController = ListaFornecedoresBuscaViewController(nibName: "ListaFornecedoresBuscaViewController", bundle: nil)
                myViewController.categoria = "Calçados"
                navigationController?.pushViewController(myViewController, animated: true)
            }
            if indexPath.row == 2 {
                let myViewController = ListaFornecedoresBuscaViewController(nibName: "ListaFornecedoresBuscaViewController", bundle: nil)
                myViewController.categoria = "Cozinha"
                navigationController?.pushViewController(myViewController, animated: true)
            }
            if indexPath.row == 3 {
                let myViewController = ListaFornecedoresBuscaViewController(nibName: "ListaFornecedoresBuscaViewController", bundle: nil)
                myViewController.categoria = "Eletrônicos"
                navigationController?.pushViewController(myViewController, animated: true)
            }
            if indexPath.row == 4 {
                let myViewController = ListaFornecedoresBuscaViewController(nibName: "ListaFornecedoresBuscaViewController", bundle: nil)
                myViewController.categoria = "Roupas"
                navigationController?.pushViewController(myViewController, animated: true)
            }
            if indexPath.row == 5 {
                let myViewController = ListaFornecedoresBuscaViewController(nibName: "ListaFornecedoresBuscaViewController", bundle: nil)
                myViewController.categoria = "Semijóias"
                navigationController?.pushViewController(myViewController, animated: true)
            }
        }
    }
}
