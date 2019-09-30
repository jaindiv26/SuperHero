//
//  CharacterInfoViewController.swift
//  SuperHero
//
//  Created by Divyansh  Jain on 27/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func makeBlurImage(targetImageView:UIImageView?)
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = targetImageView!.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        targetImageView?.addSubview(blurEffectView)
    }
}

class CharacterInfoViewController: UIViewController {
    
    let contentView = UIView()
    let scrollView = UIScrollView()
    
    let blurImage = UIImageView.init(frame: CGRect.zero)
    let charImage = UIImageView.init(frame: CGRect.zero)
    let charName = UILabel.init(frame: CGRect.zero)
    let intelligenceValue = UIProgressView.init(frame: CGRect.zero)
    let strengthValue = UIProgressView.init(frame: CGRect.zero)
    let speedValue = UIProgressView.init(frame: CGRect.zero)
    let durability = UILabel.init(frame: CGRect.zero)
    let durabilityValue = UIProgressView.init(frame: CGRect.zero)
    let powerValue = UIProgressView.init(frame: CGRect.zero)
    let combatValue = UIProgressView.init(frame: CGRect.zero)
    let fullNameValue = UILabel.init(frame: CGRect.zero)
    let placeOfBirthValue = UILabel.init(frame: CGRect.zero)
    let publisherValue = UILabel.init(frame: CGRect.zero)
    let alignmentValue = UILabel.init(frame: CGRect.zero)
    let occupationValue = UILabel.init(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        view.backgroundColor = .white
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(self.contentView)
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        
        blurImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(blurImage)
        blurImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        blurImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        blurImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        blurImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        blurImage.contentMode = .scaleToFill
        blurImage.clipsToBounds = true
        
        charImage.translatesAutoresizingMaskIntoConstraints = false
        blurImage.addSubview(charImage)
        charImage.centerXAnchor.constraint(equalTo: blurImage.centerXAnchor, constant: 0).isActive = true
        charImage.centerYAnchor.constraint(equalTo: blurImage.centerYAnchor, constant: 0).isActive = true
        charImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        charImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        charImage.contentMode = .scaleToFill
        charImage.layer.shadowColor = UIColor.black.cgColor
        charImage.layer.shadowOffset = CGSize.zero
        charImage.layer.shadowRadius = 10.0
        charImage.layer.shadowOpacity = 1.0
        
        let name = UILabel.init(frame: CGRect.zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(name)
        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        name.topAnchor.constraint(equalTo: blurImage.bottomAnchor, constant: 20).isActive = true
        name.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        name.text = "Name :"
        
        charName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(charName)
        charName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        charName.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10).isActive = true
        charName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        charName.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let powerStat = UILabel.init(frame: CGRect.zero)
        powerStat.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(powerStat)
        powerStat.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        powerStat.topAnchor.constraint(equalTo: charName.bottomAnchor, constant: 20).isActive = true
        powerStat.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        powerStat.text = "Powerstats :"
        
        let intelligence = UILabel.init(frame: CGRect.zero)
        intelligence.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(intelligence)
        intelligence.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        intelligence.topAnchor.constraint(equalTo: powerStat.bottomAnchor, constant: 10).isActive = true
        intelligence.font = UIFont.systemFont(ofSize: 16, weight: .light)
        intelligence.text = "Intelligence "
        
        intelligenceValue.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(intelligenceValue)
        intelligenceValue.leadingAnchor.constraint(equalTo: powerStat.trailingAnchor, constant: 0).isActive = true
        intelligenceValue.centerYAnchor.constraint(equalTo: intelligence.centerYAnchor, constant: 0).isActive = true
        intelligenceValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        intelligenceValue.progressViewStyle = .bar
        intelligenceValue.trackTintColor = .gray
        intelligenceValue.progressTintColor = .blue
        
        let strength = UILabel.init(frame: CGRect.zero)
        strength.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(strength)
        strength.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        strength.topAnchor.constraint(equalTo: intelligence.bottomAnchor, constant: 10).isActive = true
        strength.font = UIFont.systemFont(ofSize: 16, weight: .light)
        strength.text = "Strength "
        
        strengthValue.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(strengthValue)
        strengthValue.leadingAnchor.constraint(equalTo: powerStat.trailingAnchor, constant: 0).isActive = true
        strengthValue.centerYAnchor.constraint(equalTo: strength.centerYAnchor, constant: 0).isActive = true
        strengthValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        strengthValue.progressViewStyle = .bar
        strengthValue.trackTintColor = .gray
        strengthValue.progressTintColor = .green
        
        let speed = UILabel.init(frame: CGRect.zero)
        speed.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(speed)
        speed.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        speed.topAnchor.constraint(equalTo: strength.bottomAnchor, constant: 10).isActive = true
        speed.font = UIFont.systemFont(ofSize: 16, weight: .light)
        speed.text = "Speed "
        
        speedValue.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(speedValue)
        speedValue.leadingAnchor.constraint(equalTo: powerStat.trailingAnchor, constant: 0).isActive = true
        speedValue.centerYAnchor.constraint(equalTo: speed.centerYAnchor, constant: 0).isActive = true
        speedValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        speedValue.progressViewStyle = .bar
        speedValue.trackTintColor = .gray
        speedValue.progressTintColor = .blue
        
        let durability = UILabel.init(frame: CGRect.zero)
        durability.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(durability)
        durability.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        durability.topAnchor.constraint(equalTo: speed.bottomAnchor, constant: 10).isActive = true
        durability.font = UIFont.systemFont(ofSize: 16, weight: .light)
        durability.text = "Durability "
        
        durabilityValue.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(durabilityValue)
        durabilityValue.leadingAnchor.constraint(equalTo: powerStat.trailingAnchor, constant: 0).isActive = true
        durabilityValue.centerYAnchor.constraint(equalTo: durability.centerYAnchor, constant: 0).isActive = true
        durabilityValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        durabilityValue.progressViewStyle = .bar
        durabilityValue.trackTintColor = .gray
        durabilityValue.progressTintColor = .green
        
        let power = UILabel.init(frame: CGRect.zero)
        power.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(power)
        power.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        power.topAnchor.constraint(equalTo: durability.bottomAnchor, constant: 10).isActive = true
        power.font = UIFont.systemFont(ofSize: 16, weight: .light)
        power.text = "Power "
        
        powerValue.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(powerValue)
        powerValue.leadingAnchor.constraint(equalTo: powerStat.trailingAnchor, constant: 0).isActive = true
        powerValue.centerYAnchor.constraint(equalTo: power.centerYAnchor, constant: 0).isActive = true
        powerValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        powerValue.progressViewStyle = .bar
        powerValue.trackTintColor = .gray
        powerValue.progressTintColor = .blue
        
        let combat = UILabel.init(frame: CGRect.zero)
        combat.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(combat)
        combat.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        combat.topAnchor.constraint(equalTo: power.bottomAnchor, constant: 10).isActive = true
        combat.font = UIFont.systemFont(ofSize: 16, weight: .light)
        combat.text = "Combat "
        
        combatValue.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(combatValue)
        combatValue.leadingAnchor.constraint(equalTo: powerStat.trailingAnchor, constant: 0).isActive = true
        combatValue.centerYAnchor.constraint(equalTo: combat.centerYAnchor, constant: 0).isActive = true
        combatValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        combatValue.progressViewStyle = .bar
        combatValue.trackTintColor = .gray
        combatValue.progressTintColor = .green
        
        let biography = UILabel.init(frame: CGRect.zero)
        biography.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(biography)
        biography.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        biography.topAnchor.constraint(equalTo: combatValue.bottomAnchor, constant: 20).isActive = true
        biography.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        biography.text = "Biography :"
        
        let fullName = UILabel.init(frame: CGRect.zero)
        fullName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(fullName)
        fullName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        fullName.topAnchor.constraint(equalTo: biography.bottomAnchor, constant: 10).isActive = true
        fullName.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        fullName.text = "Full Name "
        
        fullNameValue.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(fullNameValue)
        fullNameValue.leadingAnchor.constraint(equalTo: fullName.trailingAnchor, constant: 0).isActive = true
        fullNameValue.topAnchor.constraint(equalTo: biography.bottomAnchor, constant: 10).isActive = true
        fullNameValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        fullNameValue.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let placeOfBirth = UILabel.init(frame: CGRect.zero)
        placeOfBirth.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placeOfBirth)
        placeOfBirth.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        placeOfBirth.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 10).isActive = true
        placeOfBirth.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        placeOfBirth.text = "Place Of Birth "
        
        placeOfBirthValue.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placeOfBirthValue)
        placeOfBirthValue.leadingAnchor.constraint(equalTo: placeOfBirth.trailingAnchor, constant: 0).isActive = true
        placeOfBirthValue.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 10).isActive = true
        placeOfBirthValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        placeOfBirthValue.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let publisher = UILabel.init(frame: CGRect.zero)
        publisher.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(publisher)
        publisher.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        publisher.topAnchor.constraint(equalTo: placeOfBirth.bottomAnchor, constant: 10).isActive = true
        publisher.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        publisher.text = "Publisher "
        
        publisherValue.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(publisherValue)
        publisherValue.leadingAnchor.constraint(equalTo: publisher.trailingAnchor, constant: 0).isActive = true
        publisherValue.centerYAnchor.constraint(equalTo: publisher.centerYAnchor, constant: 0).isActive = true
        publisherValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        publisherValue.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let alignment = UILabel.init(frame: CGRect.zero)
        alignment.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(alignment)
        alignment.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        alignment.topAnchor.constraint(equalTo: publisher.bottomAnchor, constant: 10).isActive = true
        alignment.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        alignment.text = "Alignment "
        
        alignmentValue.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(alignmentValue)
        alignmentValue.leadingAnchor.constraint(equalTo: alignment.trailingAnchor, constant: 0).isActive = true
        alignmentValue.centerYAnchor.constraint(equalTo: alignment.centerYAnchor, constant: 0).isActive = true
        alignmentValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        alignmentValue.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let work = UILabel.init(frame: CGRect.zero)
        work.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(work)
        work.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        work.topAnchor.constraint(equalTo: alignment.bottomAnchor, constant: 20).isActive = true
        work.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        work.text = "Work :"
        
        occupationValue.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(occupationValue)
        occupationValue.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        occupationValue.topAnchor.constraint(equalTo: work.bottomAnchor, constant: 12).isActive = true
        occupationValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        occupationValue.font = UIFont.systemFont(ofSize: 16, weight: .light)
    }
    
    init (character: SuperHeroModel) {
        super.init(nibName: nil, bundle: nil)
        
        blurImage.sd_setImage(with: URL(string: character.charImage!), placeholderImage: UIImage(named: "sample"))
        blurImage.makeBlurImage(targetImageView: blurImage)
        charImage.sd_setImage(with: URL(string: character.charImage!), placeholderImage: UIImage(named: "sample"))
        charName.text = character.charName
        
        intelligenceValue.setProgress(Float(Int(character.intelligence / 10)) / 10, animated: false)
        strengthValue.setProgress(Float(Int(character.strength / 10)) / 10, animated: false)
        speedValue.setProgress(Float(Int(character.speed / 10)) / 10, animated: false)
        durabilityValue.setProgress(Float(Int(character.durability / 10)) / 10, animated: false)
        powerValue.setProgress(Float(Int(character.power / 10)) / 10, animated: false)
        combatValue.setProgress(Float(Int(character.combat / 10)) / 10, animated: false)
        
        fullNameValue.text = character.fullName
        placeOfBirthValue.text = character.charPlaceOfBirth
        publisherValue.text = character.publisher
        alignmentValue.text = character.alignment
        occupationValue.text = character.charOccupation
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
