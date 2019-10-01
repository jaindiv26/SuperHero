//
//  SuperHeroViewModel.swift
//  SuperHero
//
//  Created by Divyansh  Jain on 27/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import Foundation

protocol SuperHeroViewModelDelegate {
    func getItems(list: [SuperHeroModel])
}

class SuperHeroViewModel {
    
    var delegate: SuperHeroViewModelDelegate?
    
    init(delegate: SuperHeroViewModelDelegate) {
        self.delegate = delegate
    }
    
    public func loadItems () {
        let baseUrl : String = "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json"
        
        let defaultSession = URLSession(configuration: .default)
        var dataTask: URLSessionDataTask?
        
        if let urlComponents = URLComponents(string: baseUrl) {
            guard urlComponents.url != nil else {
                return
            }
            
            let request = URLRequest(url: urlComponents.url!)
            
            dataTask =
                defaultSession.dataTask(with: request) { [weak self] data, response, error in
                    
                    guard let dataResponse = data,
                        error == nil else {
                            print(error?.localizedDescription ?? "Response Error")
                            return }
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with:
                            dataResponse, options: [])
                        
                        guard let jsonObject = jsonResponse as? [[String: Any]] else {
                            return
                        }
                        
                        var model: [SuperHeroModel] = []
                        
                        for i in jsonObject {
                            let charBiography = i["biography"] as! NSDictionary
                            let charAppearance = i["appearance"] as! NSDictionary
                            let charWork = i["work"] as! NSDictionary
                            let charImage = i["images"] as! NSDictionary
                            let charPowerstat = i["powerstats"] as! NSDictionary
                            let superHeroModel = SuperHeroModel.init(
                                charID: i["id"] as! Int,
                                charName: i["name"] as? String ?? "",
                                charPlaceOfBirth: charBiography["placeOfBirth"] as? String ?? "",
                                charGender: charAppearance["gender"] as? String ?? "",
                                charOccupation: charWork["occupation"] as? String ?? "",
                                charImage: charImage["lg"] as? String ?? "",
                                intelligence: charPowerstat["intelligence"] as! Int,
                                strength: charPowerstat["strength"] as! Int,
                                speed: charPowerstat["speed"] as! Int,
                                durability: charPowerstat["durability"] as! Int,
                                power: charPowerstat["power"] as! Int,
                                combat: charPowerstat["combat"] as! Int,
                                fullName: charBiography["fullName"] as? String ?? "",
                                firstAppearance: charBiography["firstAppearance"] as? String ?? "",
                                publisher: charBiography["publisher"] as? String ?? "",
                                alignment: charBiography["alignment"] as? String ?? ""
                            )
                            
                            model.append(superHeroModel)
                        }
                        self?.delegate?.getItems(list: model)
                        
                    } catch let parsingError {
                        print("Error in parsing data", parsingError)
                    }
            }
            dataTask?.resume()
        }
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
