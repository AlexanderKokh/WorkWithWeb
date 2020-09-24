//
//  Groups.swift
//  cloneVK
//
//  Created by Alexander Kokh on 11.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

struct groupInfo {
    var groupName: String
    var groupImage: UIImage
}

class GroupController: UITableViewController {
    
    var groups =  [groupInfo(groupName: "IOS developers", groupImage: UIImage(named: "IOS developers")!),
                   groupInfo(groupName: "Swift", groupImage: UIImage(named:"swift")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at:indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "showNewGroups",
            let destination = segue.destination as? NewGroups {
            destination.groupsScreen = groups
            destination.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell else {fatalError()}
        cell.groupNameLabel.text = groups[indexPath.row].groupName
        cell.groupImage.image = groups[indexPath.row].groupImage
        return cell
    }
}

extension GroupController: NewGroupsDelegate {
    func updateUserGroups(newAddGroups: [groupInfo?]) {
        let groupsDifferense = newAddGroups.count - groups.count
        guard groupsDifferense > 0 else {return}
        for i in stride (from: newAddGroups.count-1, through: groups.count, by:-1) {
            if let newGroup = newAddGroups[i] {
                groups.append(groupInfo(groupName: newGroup.groupName,groupImage: newGroup.groupImage))
            }
        }
        tableView.reloadData()
    }
}
