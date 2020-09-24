//
//  FriendCell.swift
//  cloneVK
//
//  Created by Alexander Kokh on 12.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

class FriendCell: UICollectionViewCell {
    @IBOutlet weak var friendAvatar: UIImageView!
    
    let likeControl = LikeControl()
    
  //  override func prepareForReuse() {
  //      super.prepareForReuse()
  //  }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeControl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(likeControl)
        
        let likeConstraints = [
            likeControl.leftAnchor.constraint(equalTo: friendAvatar.rightAnchor),
            likeControl.rightAnchor.constraint(equalTo: rightAnchor),
            likeControl.centerYAnchor.constraint(equalTo: friendAvatar.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(likeConstraints)
    }
}
