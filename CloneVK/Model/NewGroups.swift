//
//  NewGroups.swift
//  cloneVK
//
//  Created by Alexander Kokh on 13.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

protocol NewGroupsDelegate: class {
    func updateUserGroups(newAddGroups: [groupInfo?])
}

class NewGroups:UITableViewController {
    
    weak var  delegate: NewGroupsDelegate?
    
    var groups =  [groupInfo(groupName: "IOS developers", groupImage: UIImage(named: "IOS developers")!),
                   groupInfo(groupName: "IOS magic", groupImage: UIImage(named: "IOS magic")!),
                   groupInfo(groupName: "SWIFT UI", groupImage: UIImage(named:"swiftUI")!),
                   groupInfo(groupName: "Hack with swift", groupImage: UIImage(named:"Hack with swift")!),
                   groupInfo(groupName: "Swift for 40 days", groupImage: UIImage(named:"Swift for 40 days")!),
                   groupInfo(groupName: "Films", groupImage: UIImage(named:"films")!),
                   groupInfo(groupName: "New films", groupImage: UIImage(named:"best")!),
                   groupInfo(groupName: "Cars", groupImage:  UIImage(named:"car")!),
                   groupInfo(groupName: "Swift", groupImage: UIImage(named:"swift")!),
                   groupInfo(groupName: "How to become a senior", groupImage: UIImage(named:"senior")!),
                   groupInfo(groupName: "Best films", groupImage: UIImage(named:"Best films")!),
    ]
    
    var groupsScreen = [groupInfo?]()
    
    var newGroupsScreen =  [groupInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count - groupsScreen.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var itsEqual: Bool
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupCell") as? AllGroupCell else {fatalError()}
        for elementGroup in groups {
            itsEqual = false
            for elementUserGroups in groupsScreen {
                let valueUsergroup = elementUserGroups?.groupName
                if valueUsergroup == elementGroup.groupName {
                    itsEqual = true
                    break
                }
            }
            if !itsEqual {
                newGroupsScreen.append(groupInfo(groupName: elementGroup.groupName,groupImage: elementGroup.groupImage))
            }
        }
        cell.newGroupNameLabel.text = newGroupsScreen[indexPath.row].groupName
        cell.newGroupImage.image = newGroupsScreen[indexPath.row].groupImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let shareAction = UITableViewRowAction(style: .default, title: "Вступить в группу") {
            _, indexPath in
            let alert = UIAlertController(title: self.newGroupsScreen[indexPath.row].groupName, message: "Группа успешно добавлена", preferredStyle: .alert)
            
            self.groupsScreen.append(groupInfo(groupName: self.newGroupsScreen[indexPath.row].groupName, groupImage: self.newGroupsScreen[indexPath.row].groupImage))
            
            self.newGroupsScreen.remove(at:indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel) { (sender: UIAlertAction) -> Void in
            })
            
            self.present(alert, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor.blue
        
        return [shareAction]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.updateUserGroups(newAddGroups: groupsScreen)
    }
}
