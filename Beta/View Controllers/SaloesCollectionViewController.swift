//
//  SaloesCollectionViewController.swift
//  Beta
//
//  Created by Ian Fagundes on 01/05/19.
//  Copyright © 2019 Ian Fagundes. All rights reserved.
//

import UIKit
import collection_view_layouts

//MARK: - Protocol

public protocol ContentDynamicLayoutDelegate: class {
    func cellSize(indexPath: IndexPath) -> CGSize
}

//MARK: - Cell Definition
private let itemsPerRow: CGFloat = 2

private let sectionInsets = UIEdgeInsets(top: 50.0,
                                         left: 20.0,
                                         bottom: 50.0,
                                         right: 20.0)

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
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
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
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
cell.backgroundColor = .black
        // Configure the cell
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
}

// MARK: - Collection View Flow Layout Delegate
extension UICollectionViewController : UICollectionViewDelegateFlowLayout {
    //1
    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

