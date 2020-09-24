//
//  FriendViewController.swift
//  cloneVK
//
//  Created by Alexander Kokh on 12.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

class FriendViewController: UICollectionViewController {

    var friendtitle: String?
    var friendImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        title = friendtitle
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as? FriendCell else {fatalError()}
        cell.friendAvatar.image = friendImage
        return cell
    }
}
