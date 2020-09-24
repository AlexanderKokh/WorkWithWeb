//
//  LikeControl.swift
//  cloneVK
//
//  Created by Alexander Kokh on 20.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

class LikeControl: UIControl {
    
    private var count: Int = 0
    
    private let countlabel = UILabel()
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        countlabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        addSubview(countlabel)
        
       let imageConstraints = [
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: countlabel.leftAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
             imageView.heightAnchor.constraint(equalTo: heightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 20)
            ]
    
        let labelConstraint = [
            countlabel.rightAnchor.constraint(equalTo: rightAnchor),
            countlabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(imageConstraints + labelConstraint)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onHeartTapped(_:)))
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = true
        updateView()
    }
   
    private func updateView() {
        countlabel.text = "\(count)"
        if isSelected {
            imageView.image = UIImage(systemName: "heart.fill")
        }
        else {
           imageView.image = UIImage(systemName: "heart")
        }
    }
    
    @objc func onHeartTapped(_ gesture: UITapGestureRecognizer) {
        isSelected = !isSelected
        count += isSelected ? 1 : -1
        updateView()
        sendActions(for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
