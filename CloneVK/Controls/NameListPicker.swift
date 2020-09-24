//
//  NameListPicker.swift
//  cloneVK
//
//  Created by Alexander Kokh on 22.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

 class NameListPicker: UIControl {
    var selectedDay: Character? {
        didSet {
            updateSelectedDay()
            sendActions(for: .valueChanged)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private var buttons: [UIButton] = []
    private var buttonsTitle: [Character] = []
    private var stackView: UIStackView!
    
    private func setupView() {
        
        var friendsData = FriendData()
        friendsData.fillSections()
        
        for day in friendsData.sectionTitles {
            let button = UIButton(type: .system)
            button.setTitle(String(day), for: .normal)
           
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            
            button.addTarget(self, action: #selector(daySelected(_:)), for: .touchUpInside)
            buttons.append(button)
            buttonsTitle.append(day)
        }
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        
        addSubview(stackView)
    }
    
    @objc func daySelected( _ button: UIButton) {
        guard let index = buttons.firstIndex(of: button) else {return}
        let day =  buttonsTitle[index]
        selectedDay = day
    }
    
    private func updateSelectedDay() {
        for (index, button) in buttons.enumerated() {
            let day = buttonsTitle[index]
            button.isSelected = day == selectedDay
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
}
