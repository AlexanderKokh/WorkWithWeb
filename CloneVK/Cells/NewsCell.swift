//
//  NewsCell.swift
//  cloneVK
//
//  Created by Alexander Kokh on 27.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet var labelIconNews: UIImageView!
    @IBOutlet var labelNameNews: UILabel!
    @IBOutlet var labelTimeAdd: UILabel!
    @IBOutlet var labelDescriptionNews: UILabel!
    @IBOutlet var labelMainPhotoNews: UIImageView!
    @IBOutlet var labelCountLike: UILabel!
    @IBOutlet var labelCountComments: UILabel!
    @IBOutlet var labelCountTwits: UILabel!
    @IBOutlet var labelCountViews: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
