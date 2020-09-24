//
//  UserCell.swift
//  cloneVK
//
//  Created by Alexander Kokh on 11.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendContainerView: UIView!
      
      override func prepareForReuse() {
          super.prepareForReuse()
      }
      
      override func awakeFromNib() {
          super.awakeFromNib()
        
          friendContainerView.layer.cornerRadius = friendContainerView.bounds.width/2
          friendContainerView.layer.shadowColor = UIColor.black.cgColor
          friendContainerView.layer.shadowRadius = 10
          friendContainerView.layer.shadowOpacity = 0.5
          friendContainerView.layer.shadowOffset = .zero
          friendContainerView.layer.shadowPath = UIBezierPath(ovalIn: friendContainerView.bounds).cgPath
          
          friendImage.layer.cornerRadius = friendContainerView.bounds.width/2
          friendImage.clipsToBounds = true
        
      }
}
