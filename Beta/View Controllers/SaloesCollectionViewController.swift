//
//  SaloesCollectionViewController.swift
//  Beta
//
//  Created by Ian Fagundes on 01/05/19.
//  Copyright © 2019 Ian Fagundes. All rights reserved.
//

import UIKit
import collection_view_layouts

////MARK: - Protocol
//
//public protocol ContentDynamicLayoutDelegate: class {
//    func cellSize(indexPath: IndexPath) -> CGSize
//}

//MARK: - Cell Definition
private let itemsPerRow: CGFloat = 1.0
private let inset: CGFloat = 8.0
private let spacing: CGFloat = 8.0
private let lineSpacing: CGFloat = 8.0

//private let sectionInsets = UIEdgeInsets(top: 10.0,
//                                         left: 15.0,
//                                         bottom: 10.0,
//                                         right: 15.0)

//Mark: Class
class SaloesCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "salaoCell"
    
    var resultadosBuscaSalao:[Salao] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let salao1 = Salao(Id: 1, name: "Salao1", Imagem: UIImage(named: "feminino")!)
        let salao2 = Salao(Id: 2, name: "Salao2", Imagem: UIImage(named: "masculino")!)
        let salao3 = Salao(Id: 3, name: "Salao3", Imagem: UIImage(named: "unisex")!)
        let salao4 = Salao(Id: 4, name: "Salao4", Imagem: UIImage(named: "feminino")!)
        let salao5 = Salao(Id: 5, name: "Salao5", Imagem: UIImage(named: "masculino")!)
        
        resultadosBuscaSalao.append(salao1)
        resultadosBuscaSalao.append(salao2)
        resultadosBuscaSalao.append(salao3)
        resultadosBuscaSalao.append(salao4)
        resultadosBuscaSalao.append(salao5)
    
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //return the number of sections
        return resultadosBuscaSalao.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return the number of items
        return resultadosBuscaSalao.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SalaoCollectionViewCell
        // Configure the cell
        
        cell.backgroundColor = .white

        cell.image.image = resultadosBuscaSalao[indexPath.row].Imagem
        cell.label.text = resultadosBuscaSalao[indexPath.row].name
        cell.descriptionLabel.text = resultadosBuscaSalao[indexPath.row].name

        return cell
    }
}

// MARK: - Collection View Flow Layout Delegate
extension SaloesCollectionViewController : UICollectionViewDelegateFlowLayout {
    //1
    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let widthPerItem = availableWidth / itemsPerRow
        
        let width = Int((collectionView.frame.width / itemsPerRow) - inset)
        return CGSize(width: width, height: width)
    }
    
    //3
    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    // 4
    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
}

