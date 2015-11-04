//
//  APIDataManager.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import Alamofire
import Genome

enum APIError : ErrorType {
    case UnableToConvertJson
}

enum APIResult<T> {
    case Success(T)
    case Failure(ErrorType)
}

struct APIClient: DataManagerInterface {

    func fetchShows(completion: APIResult<[TVShow]> -> Void) -> Alamofire.Request {        
        return Alamofire.request(APIRouter.TVShows(id: nil)).responseJSON { (response) in
            switch response.result {
            case .Success(let value):
                do {
                    let json = try self.toJsonArray(value)
                    let shows = try [TVShow].mappedInstance(json)
                    
                    completion(.Success(shows))
                }
                catch {
                    completion(.Failure(error))
                }
            case .Failure(let error):
                completion(.Failure(error))
            }
        }
    }
    
}

extension APIClient {
    
    private func toJson(value: AnyObject) throws -> JSON {
        if let json = value as? JSON {
            return json
        }
        else {
            throw APIError.UnableToConvertJson
        }
    }
    
    private func toJsonArray(value: AnyObject) throws -> [JSON] {
        if let json = value as? [JSON] {
            return json
        }
        else {
            throw APIError.UnableToConvertJson
        }
    }
    
}
