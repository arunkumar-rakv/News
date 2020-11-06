//
//  Services.swift
//  News
//
//  Created by admin on 06/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation
import Alamofire

class Services {
    
    private static func sendRequest<T:Decodable>(route: String, parameters: [String: String]?, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route, method: .get, parameters: parameters).responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in completion(response.result)
        }
    }
    
    static func fetchEverything(parameters: [String: String]? = nil, completion:@escaping (Result<NewsArticles, AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        sendRequest(route: Routes.everything, parameters: parameters, decoder: jsonDecoder, completion: completion)
    }
    
    static func fetchTopHeadlines(parameters: [String: String]? = nil, completion:@escaping (Result<NewsArticles, AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        sendRequest(route: Routes.topHeadlines, parameters: parameters, decoder: jsonDecoder, completion: completion)
    }
}
