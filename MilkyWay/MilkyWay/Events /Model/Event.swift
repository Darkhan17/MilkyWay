//
//  Event.swift
//  MilkyWay
//
//  Created by Khamitov Darkhan on 6/30/21.
//

import Foundation
import UIKit

class Event {
    var flightNumber: Int
    var name: String
    var eventImage: UIImage?
    var imageUrl : URL?
    var webcast : String?
    var details : String?
    var date : Date?
    
    
    //var date: Date
    
    
    init?(dict: [String: AnyObject]) {
        guard let flightNumber = dict["flight_number"] as? Int ,
            let name = dict["name"] as? String
            //let imageUrl = Event.getImageUrl(dict: dict)
        else {
            return nil
        }
        
        self.flightNumber = flightNumber
        self.name = name
        self.details = dict["details"] as? String
        self.webcast = getWebcastId(dict: dict)
        self.imageUrl = self.getImageUrl(dict: dict)
        self.date = getDate(dict: dict)
    }
    
    
    private func getImageUrl(dict:[String: AnyObject]) -> URL?{
        guard let links = dict["links"] as? [String: Any],
        let patch = links["patch"] as? [String: Any],
        let imageUrl = patch["small"] as? String else {return nil}
        let url = URL(string: imageUrl)!
        return url
    }
    
    private func getWebcastId(dict: [String:AnyObject]) -> String?{
        guard let links = dict["links"] as? [String:AnyObject],
              let webcastId = links["youtube_id"] as? String
              else { return nil }
        return webcastId
    }
    
    private func getDate(dict: [String : AnyObject]) -> Date?{
        guard let dateString = dict["date_utc"] as? String else {
            return nil
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        return formatter.date(from: dateString)
    }
    
    
    
}
