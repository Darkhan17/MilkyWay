//
//  EventNetworkService.swift
//  MilkyWay
//
//  Created by Khamitov Darkhan on 6/30/21.
//

import Foundation
import UIKit

class EventNetworkService {
    private init(){}
    
    static func getEvents(completion: @escaping(GetEventResponse) -> ()){
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches/upcoming") else { return }
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetEventResponse(json: json)
                completion(response)
            } catch{
                print(error)
            }
            
        }
    }
    
    static func getImage(from url: URL?, comletion: @escaping(UIImage)->()) {
        guard let imageUrl = url else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageUrl){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        comletion(image)
                    }
                }
            }
        }
    }
     
    

}
