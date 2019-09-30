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
        self.title = "Superhero's Lair"
        view.backgroundColor = .white
        
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 10
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let nav = UINavigationController.init(rootViewController: CharacterInfoViewController.init(character: superHeroList[indexPath.row]))
//        nav.setToolbarHidden(false, animated: true)
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
