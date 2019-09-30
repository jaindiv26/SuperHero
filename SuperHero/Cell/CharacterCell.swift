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
    
    let label = UILabel.init(frame: CGRect.init())
    let charPic = UIImageView.init(frame: CGRect.zero)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        charPic.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(charPic)
        charPic.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        charPic.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        charPic.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        charPic.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        charPic.heightAnchor.constraint(equalToConstant: contentView.frame.height - 42).isActive = true
        charPic.layer.borderWidth = 0.5
        charPic.layer.masksToBounds = false
        charPic.layer.borderColor = UIColor.black.cgColor
        charPic.layer.cornerRadius = 5
        charPic.clipsToBounds = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        label.topAnchor.constraint(equalTo: charPic.bottomAnchor, constant: 12).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
    }
    
    func addData(character: SuperHeroModel) {
        charPic.sd_setImage(with: URL(string: character.charImage!), placeholderImage: UIImage(named: "sample"))
        label.text = character.charName
    }
}
