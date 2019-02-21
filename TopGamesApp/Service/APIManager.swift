//
//  File.swift
//  TopGames
//
//  Created by Thiago Cavalcante de Oliveira on 23/12/18.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    
    static let mainUrl = "https://api.twitch.tv/kraken"
    static let clientId = "rew23czzdgrosibji7tp5kw8idyc4v" //Twitch Client ID
    init(){
        Alamofire.SessionManager.default.adapter = TwitchHeadersAdapter()
    }
    
    func getListGames(limit: Int, offSet: Int, completed:@escaping(GameList?) -> Void) {
        let url = "\(APIManager.mainUrl)/games/top?limit=\(limit)&offset=\(offSet)"
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let resp = response.data {
                let gameList = try? JSONDecoder().decode(GameList.self, from: resp)
                completed(gameList)
            }
        }
    }
}

class TwitchHeadersAdapter: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        
        //Adds custom required headers according to Twitch API documentation:
        //https://dev.twitch.tv/docs/v5/reference/games
        urlRequest.setValue("application/vnd.twitchtv.v5+json", forHTTPHeaderField: "Accept")
        urlRequest.setValue(APIManager.clientId, forHTTPHeaderField: "Client-ID")
        
        return urlRequest
    }
    
}

