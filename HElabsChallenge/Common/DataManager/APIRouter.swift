//
//  APIRouter.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    static let baseURLString = "http://api.tvmaze.com"
    
    case TVShows(id: Int?)
    
    var URLRequest: NSMutableURLRequest {
        let result: (method: Alamofire.Method, path: String, parameters: [String: AnyObject]?) = {
            switch self {
            case .TVShows(let id) where id != nil:
                return (.GET, "/shows/\(id!)", nil)
            case .TVShows(_):
                return (.GET, "/shows", nil)
            }
        }()
        
        let URL = NSURL(string: APIRouter.baseURLString)!
        
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        URLRequest.HTTPMethod = result.method.rawValue
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        return encoding.encode(URLRequest, parameters: result.parameters).0
    }
    
}
