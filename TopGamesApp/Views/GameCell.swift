//
//  CollectionViewCell.swift
//  TopGames
//
//  Created by Thiago Cavalcante de Oliveira on 23/12/18.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit
import SDWebImage
class GameCell: UICollectionViewCell{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configGameCell(name:String, img:String?) {
        imageView.sd_setImage(with: URL(string: img!), completed: { (image, error, cacheType, url) in
            //self.activityView.isHidden = true
        })

        labelName.text = name
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
    }
}
