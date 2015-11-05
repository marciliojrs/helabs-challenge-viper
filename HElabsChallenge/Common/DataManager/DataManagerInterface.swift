//
//  DataManagerInterface.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import Alamofire

protocol DataManagerInterface {

    func fetchShows(completion: APIResult<[TVShow]> -> Void) -> Alamofire.Request
    func fetchShowWithId(showId: Int, completion: APIResult<TVShow> -> Void) -> Alamofire.Request
    
}
