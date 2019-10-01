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
    
    var imageHeightConstraint: NSLayoutConstraint?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        charPic.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(charPic)
        charPic.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        charPic.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        charPic.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        charPic.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        imageHeightConstraint = charPic.heightAnchor.constraint(equalToConstant: contentView.frame.width / 0.75)
        imageHeightConstraint?.isActive = true
        charPic.layer.borderWidth = 0.5
        charPic.layer.masksToBounds = false
        charPic.layer.borderColor = UIColor.black.cgColor
        charPic.layer.cornerRadius = 5
        charPic.clipsToBounds = true
        
        charAlignment.translatesAutoresizingMaskIntoConstraints = false
        charPic.addSubview(charAlignment)
        charAlignment.trailingAnchor.constraint(equalTo: charPic.trailingAnchor, constant: -10).isActive = true
        charAlignment.bottomAnchor.constraint(equalTo: charPic.bottomAnchor, constant: -10).isActive = true
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
        charName.topAnchor.constraint(equalTo: charPic.bottomAnchor, constant: 12).isActive = true
        charName.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        charName.textColor = .black
        charName.lineBreakMode = .byWordWrapping
        charName.numberOfLines = 1
        
        let spacerView = UIView.init(frame: CGRect.zero)
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(spacerView)
        spacerView.topAnchor.constraint(equalTo: charName.bottomAnchor, constant: 12).isActive = true
        spacerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        spacerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        spacerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        spacerView.backgroundColor = .black
    }
    
    func addData(character: SuperHeroModel) {
        charPic.sd_setImage(with: URL(string: character.charImage!), placeholderImage: UIImage(named: "sample"))
        imageHeightConstraint?.constant = self.frame.width/0.75
        charName.text = character.charName
        
        if character.alignment == "good" {
            charAlignment.image = UIImage(named: "angel")
        } else {
            charAlignment.image = UIImage(named: "devil")
        }
    }
}
