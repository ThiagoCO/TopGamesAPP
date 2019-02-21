//
//  GameDetailViewController+DetailView.swift
//  TopGames
//
//  Created by Thiago Cavalcante de Oliveira on 23/12/18.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit
import SDWebImage

protocol DetailView {
    func stopLoad()
    func startLoad()
    func setChannels(channels:String)
    func setViews(views:String)
    func setImage(url:String)
    func setNavigationTitle(name:String)
}

extension GameDetailViewController: DetailView {
    
    func stopLoad() {
        activityIndicator.removeFromSuperview()
    }
    
    func startLoad() {
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = self.view.frame
        activityIndicator.startAnimating()
    }
    
    func setChannels(channels: String) {
        labelChannels.text = "\(channels) Channels"
    }
    
    func setViews(views: String) {
        labelViews.text = "\(views) Views"
    }
    
    func setImage(url: String) {
        imageView.sd_setImage(with: URL(string: url), completed: { (image, error, cacheType, url) in })
    }
    
    func setNavigationTitle(name:String) {
        self.navigationItem.title = name
    }
    
    
}
