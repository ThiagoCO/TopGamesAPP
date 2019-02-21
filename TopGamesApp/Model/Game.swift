//
//  Games.swift
//  TopGames
//
//  Created by Thiago Cavalcante de Oliveira on 23/12/18.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

struct GameList : Codable {
    var _total: Int
    var top: [Game]
}

struct Game: Codable {
    var game: GameDetail
    var viewers: Int
    var channels: Int
}

struct GameDetail: Codable {
    var name: String
    var box: Dictionary<String,String>
}
