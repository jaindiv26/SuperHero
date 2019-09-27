//
//  SuperHeroViewModel.swift
//  SuperHero
//
//  Created by Divyansh  Jain on 27/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import Foundation

protocol SuperHeroViewModelDelegate {
    func getItems(characterInfo: SuperHeroModel)
}

class SuperHeroViewModel {
    
    var delegate: SuperHeroViewModelDelegate?
    
    init(delegate: SuperHeroViewModelDelegate) {
        self.delegate = delegate
    }
    
    var model: [SuperHeroModel] = []
    
    public func loadItems (count: Int) {
        let baseUrl : String = "https://superheroapi.com/api/506782146534313/" + String(count)
        
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
                        
                        guard let jsonObject = jsonResponse as? NSDictionary else {
                            return
                        }
                        
                        let charBiography = jsonObject.value(forKey: "biography") as! NSDictionary
                        let charAppearance = jsonObject.value(forKey: "appearance") as! NSDictionary
                        let charWork = jsonObject.value(forKey: "work") as! NSDictionary
                        let charImage = jsonObject.value(forKey: "image") as! NSDictionary
                        
                        let superHeroModel = SuperHeroModel.init(
                            charID: jsonObject.value(forKey: "id") as! String,
                            charName: jsonObject.value(forKey: "name") as! String,
                            charPlaceOfBirth: charBiography.value(forKey: "place-of-birth") as! String,
                            charGender: charAppearance.value(forKey: "gender") as! String,
                            charOccupation: charWork.value(forKey: "occupation") as! String,
                            charImage: charImage.value(forKey: "url") as! String
                        )
                        
                        self?.delegate?.getItems(characterInfo: superHeroModel)
                        
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
