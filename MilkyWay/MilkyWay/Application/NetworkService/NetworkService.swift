//
//  NetworkService.swift
//  MilkyWay
//
//  Created by Khamitov Darkhan on 6/30/21.
//

import Foundation

class NetworkService{
    private init(){}
    
    static let shared = NetworkService()
    
    
    func getData(url: URL, completionHandler: @escaping(Any)->()) {
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async{
                    completionHandler(json)
                }
               // print(json)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
    
}
