//
//  SuperHeroModel.swift
//  SuperHero
//
//  Created by Divyansh  Jain on 27/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import Foundation

class SuperHeroModel {
    
    var charID: Int = 0
    var charName: String = ""
    var charPlaceOfBirth: String = ""
    var charGender: String = ""
    var charOccupation: String = ""
    var charImage: String = ""
    
    init(charID: Int,
         charName: String,
         charPlaceOfBirth: String,
         charGender: String,
         charOccupation: String,
         charImage: String) {
        
        self.charID = charID
        self.charName = charName
        self.charPlaceOfBirth = charPlaceOfBirth
        self.charGender = charGender
        self.charOccupation = charOccupation
        self.charImage = charImage
    }
}
