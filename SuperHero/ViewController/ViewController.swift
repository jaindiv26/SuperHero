//
//  ViewController.swift
//  SuperHero
//
//  Created by Divyansh  Jain on 27/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
    SuperHeroViewModelDelegate
{
    
    var viewModel: SuperHeroViewModel?
    var superHeroList: [SuperHeroModel] = []
    let flowLayout = UICollectionViewFlowLayout()
    var collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    let slider = UISlider.init(frame: CGRect.zero)
    
    @objc func sliderValue(slider: UISlider, event: UIEvent, width: CGFloat) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .ended:
                
                let sliderValue = Int(slider.value)
                
                print(sliderValue)
                
                let phoneWidth = CGFloat(self.view.frame.width)
                let cellPadding = CGFloat((sliderValue + 1) * 12)
                
                let cellWidth : CGFloat = ((phoneWidth - cellPadding) / CGFloat(sliderValue))
                let cellSize = CGSize(width: cellWidth , height: (cellWidth / 0.75) + 40)
                
                flowLayout.invalidateLayout()
                flowLayout.itemSize = cellSize
                self.collectionView.reloadData()
            default:
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Superhero's Lair"
        
        view.backgroundColor = .white
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        slider.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        slider.maximumValue = 6
        slider.minimumValue = 2
        slider.isContinuous = false
        slider.addTarget(self, action: #selector(sliderValue), for: .valueChanged)
        
        let phoneWidth = CGFloat(self.view.frame.width)
        let cellPadding = CGFloat((2 + 1) * 12)
        
        let cellWidth : CGFloat = ((phoneWidth - cellPadding) / CGFloat(2))
        let cellSize = CGSize(width: cellWidth , height: (cellWidth / 0.75) + 40)
        
        flowLayout.itemSize = cellSize
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 12
        flowLayout.minimumInteritemSpacing = 12
        flowLayout.scrollDirection = .vertical
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        collectionView.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 12).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        
        viewModel = SuperHeroViewModel.init(delegate: self)
        viewModel?.loadItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        superHeroList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CharacterCell
        cell.addData(character: superHeroList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(CharacterInfoViewController.init(character: superHeroList[indexPath.row]), animated: true)
    }
    
    func getItems(list: [SuperHeroModel]) {
        self.superHeroList.removeAll()
        self.superHeroList = list
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
