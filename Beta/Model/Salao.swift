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
// var phone: String
// var phone2: String
// var email: String
// var adress: String
// var latitude: Double
// var longitude: Double
// var bussinessHours: String
// var description: String
// var imageLogo: String
// var images: Array<String>
// var specialtys: String
// var gender: String
    
    
    
    init(Id: Int, name:String, Imagem:UIImage) {
        
        self.Id = Id
        self.name = name
        self.Imagem = Imagem
        
    }
}

