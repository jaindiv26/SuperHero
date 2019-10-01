//
//  CharacterCell.swift
//  SuperHero
//
//  Created by Divyansh  Jain on 27/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class CharacterCell: UICollectionViewCell {

    let charPic = UIImageView.init(frame: CGRect.zero)
    let charName = UILabel.init(frame: CGRect.init())
    let charPower = UILabel.init(frame: CGRect.init())
    let charLocation = UILabel.init(frame: CGRect.init())
    let charAlignment = UIImageView.init(frame: CGRect.zero)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        charPic.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(charPic)
        charPic.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        charPic.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        charPic.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        charPic.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        charPic.heightAnchor.constraint(equalToConstant: contentView.frame.height - 80).isActive = true
        charPic.layer.borderWidth = 0.5
        charPic.layer.masksToBounds = false
        charPic.layer.borderColor = UIColor.black.cgColor
        charPic.layer.cornerRadius = 5
        charPic.clipsToBounds = true
        
        charAlignment.translatesAutoresizingMaskIntoConstraints = false
        charPic.addSubview(charAlignment)
        charAlignment.leadingAnchor.constraint(equalTo: charPic.trailingAnchor, constant: -50).isActive = true
        charAlignment.topAnchor.constraint(equalTo: charPic.bottomAnchor, constant: -50).isActive = true
        charAlignment.widthAnchor.constraint(equalToConstant: 40).isActive = true
        charAlignment.heightAnchor.constraint(equalToConstant: 40).isActive = true
        charAlignment.contentMode = .scaleToFill
        charAlignment.layer.shadowColor = UIColor.white.cgColor
        charAlignment.layer.shadowOffset = CGSize.zero
        charAlignment.layer.shadowRadius = 20.0
        charAlignment.layer.shadowOpacity = 5.0
        
        charName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(charName)
        charName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        charName.topAnchor.constraint(equalTo: charPic.bottomAnchor, constant: 13).isActive = true
        charName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        charName.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        charName.textColor = .black
        charName.lineBreakMode = .byWordWrapping
        charName.numberOfLines = 0
        
        contentView.bottomAnchor.constraint(equalTo: charName.bottomAnchor, constant: 10).isActive = true
    }
    
    func addData(character: SuperHeroModel) {
        charPic.sd_setImage(with: URL(string: character.charImage!), placeholderImage: UIImage(named: "sample"))
        charName.text = character.charName
        
        if character.alignment == "good" {
            charAlignment.image = UIImage(named: "angel")
        } else {
            charAlignment.image = UIImage(named: "devil")
        }
    }
}
