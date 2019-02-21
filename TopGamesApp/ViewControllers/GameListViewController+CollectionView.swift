//
//  GameListViewController+CollectionView.swift
//  TopGames
//
//  Created by Thiago Cavalcante de Oliveira on 23/12/18.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

extension GameListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameListViewModel?.listGames?.top.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GameCell
        if let listGames = gameListViewModel?.listGames {
            cell.configGameCell(name: listGames.top[indexPath.row].game.name, img:listGames.top[indexPath.row].game.box["medium"])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let countCell = gameListViewModel?.listGames?.top.count else { return }
        if(indexPath.row == countCell - 1) {
            gameListViewModel?.getGameList()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewModel = gameListViewModel {
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "detail") as? GameDetailViewController {
                controller.gameDetail = viewModel.listGames?.top[indexPath.row]
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
  
    
    
}
