//
//  GameDetailViewModel.swift
//  TopGames
//
//  Created by Thiago Cavalcante de Oliveira on 24/12/18.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class GameDetailViewModel {
    
    var view: DetailView
    var game:Game
    
    init(view:DetailView, game:Game){
        self.view = view
        self.game = game
        configDetail()
    }
    
    func configDetail() {
        view.startLoad()
        if let urlImage = game.game.box["large"] {
            view.setNavigationTitle(name: game.game.name)
            view.setImage(url: urlImage)
            view.setChannels(channels: String(game.channels))
            view.setViews(views: String(game.viewers))
            view.stopLoad()
        }
        
    }
    
}
