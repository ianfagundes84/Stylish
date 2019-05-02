//
//  Salao.swift
//  Beta
//
//  Created by Ian Fagundes on 01/05/19.
//  Copyright © 2019 Ian Fagundes. All rights reserved.
//

import Foundation
import UIKit

class Salao {
    
    var Id: Int
    var name: String
    var Imagem: UIImage!
    
    init(Id: Int, name:String, Imagem:UIImage) {
        
        self.Id = Id
        self.name = name
        self.Imagem = Imagem
        
    }
}
