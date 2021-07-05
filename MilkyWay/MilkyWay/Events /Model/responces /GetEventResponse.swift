//
//  GetEventResponse.swift
//  MilkyWay
//
//  Created by Khamitov Darkhan on 6/30/21.
//

import Foundation

class GetEventResponse {
    
    typealias JSON = [String: AnyObject]
    var events: [Event]
    
    init(json: Any) throws {
        guard let array = json as? [JSON]  else { throw NetworkError.failDataError }
        var events = [Event]()
        for dict in array {
            guard let event = Event(dict: dict) else {continue}
            events.append(event)
        }
        self.events = events
    }
}
