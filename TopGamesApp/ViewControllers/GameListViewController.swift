//
//  GameListViewController.swift
//  TopGames
//
//  Created by Thiago Cavalcante de Oliveira on 23/12/18.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class GameListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    var gameListViewModel:GameListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.gameListViewModel = GameListViewModel(view: self)
    }
    
}
