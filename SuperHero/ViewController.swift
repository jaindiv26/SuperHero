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
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel.init(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Welcome to the Superhero Lair"
        
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 10
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        
        viewModel = SuperHeroViewModel.init(delegate: self)
        viewModel?.loadItems(count: self.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        superHeroList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        return CGSize(width: (screenWidth/2)-6, height: screenWidth * 3 / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CharacterCell
        cell.addData(character: superHeroList[indexPath.row])
        return cell
    }
    
    func getItems(list: [SuperHeroModel]) {
        self.superHeroList.removeAll()
        self.superHeroList = list
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
