//
//  SuperHeroModel.swift
//  SuperHero
//
//  Created by Divyansh  Jain on 27/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import Foundation

public class SuperHeroModel {
    
    var charID: Int = 0
    var charName: String?
    var charPlaceOfBirth: String?
    var charGender: String?
    var charOccupation: String?
    var charImage: String?
    var intelligence: Int = 0
    var strength: Int = 0
    var speed: Int = 0
    var durability: Int = 0
    var power: Int = 0
    var combat: Int = 0
    var fullName: String?
    var firstAppearance: String?
    var publisher: String?
    var alignment: String?
    
    init(charID: Int,
         charName: String,
         charPlaceOfBirth: String,
         charGender: String,
         charOccupation: String,
         charImage: String,
         intelligence: Int,
         strength: Int,
         speed: Int,
         durability: Int,
         power: Int,
         combat: Int,
         fullName: String,
         firstAppearance: String,
         publisher: String,
         alignment: String
    ) {
        
        self.charID = charID
        self.charName = charName
        self.charPlaceOfBirth = charPlaceOfBirth
        self.charGender = charGender
        self.charOccupation = charOccupation
        self.charImage = charImage
        self.intelligence = intelligence
        self.strength = strength
        self.speed = speed
        self.durability = durability
        self.power = power
        self.combat = combat
        self.fullName = fullName
        self.firstAppearance = firstAppearance
        self.publisher = publisher
        self.alignment = alignment
    }
}
