//
//  GameDetailViewController.swift
//  TopGames
//
//  Created by Thiago Cavalcante de Oliveira on 23/12/18.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelChannels: UILabel!
    @IBOutlet weak var labelViews: UILabel!
    
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    var detailViewModel:GameDetailViewModel?
    var gameDetail:Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let game = gameDetail {
            detailViewModel = GameDetailViewModel(view: self, game: game)
        }
    }
}
