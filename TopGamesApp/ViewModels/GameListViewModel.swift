//
//  GameListViewModel.swift
//  TopGames
//
//  Created by Thiago Cavalcante de Oliveira on 23/12/18.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class GameListViewModel {
    
    var listGames: GameList?
    var view:ListView
    
    init(view:ListView){
        self.view = view
        getGameList()
    }
    
    func getGameList(){
        if(listGames?.top == nil) {
            view.startLoad()
            APIManager.shared.getListGames(limit: 10, offSet: 1) { (listGames) in
                
                self.listGames = listGames
                self.listGames?.top.sort(by: { $0.viewers > $1.viewers})
                self.view.reloadCollection()
                self.view.stopLoad()
            }
        }
        else {
            APIManager.shared.getListGames(limit: 10, offSet: listGames?.top.count ?? 1) { (listGame) in
                if let  list = listGame?.top{
                    for game in list {
                        self.listGames?.top.append(game)
                    }
                }
                self.listGames?.top.sort(by: { $0.viewers > $1.viewers})
                self.view.reloadCollection()
            }
        }
    }
    
}
