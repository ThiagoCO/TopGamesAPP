//
//  GameListViewController+ListView.swift
//  TopGames
//
//  Created by Thiago Cavalcante de Oliveira on 23/12/18.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

protocol ListView {
    func stopLoad()
    func startLoad()
    func reloadCollection()
}
extension GameListViewController: ListView {
    func stopLoad() {
        collectionView.isHidden = false
        activityIndicator.removeFromSuperview()
    }
    
    func startLoad() {
        collectionView.isHidden = true
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = self.view.frame
        activityIndicator.startAnimating()
    }
    
    func reloadCollection() {
        collectionView.reloadData()
    }
    
    
}
