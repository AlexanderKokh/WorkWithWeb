//
//  FriendsViewControler.swift
//  cloneVK
//
//  Created by Alexander Kokh on 23.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

struct friendInfo {
    var friendName: String
    var friendAvatar: UIImage
}

struct FriendData {
    
    var friends = [friendInfo(friendName: "Хью Лори", friendAvatar: UIImage(named: "House")!),
                   friendInfo(friendName: "Вин Дизель",   friendAvatar: UIImage(named: "dizel")!),
                   friendInfo(friendName: "Джек Воробей", friendAvatar: UIImage(named: "Jack")!),
                   friendInfo(friendName: "Риана", friendAvatar: UIImage(named: "riana")!),
                   friendInfo(friendName: "Итан", friendAvatar: UIImage(named: "kid")!),
                   friendInfo(friendName: "Холмс", friendAvatar: UIImage(named: "House")!),
                   friendInfo(friendName: "Один",   friendAvatar: UIImage(named: "dizel")!),
                   friendInfo(friendName: "Леон", friendAvatar: UIImage(named: "Jack")!),
                   friendInfo(friendName: "Риана new", friendAvatar: UIImage(named: "riana")!),
                   friendInfo(friendName: "Златан", friendAvatar: UIImage(named: "kid")!),
                   friendInfo(friendName: "Рузанна", friendAvatar: UIImage(named: "riana")!),
                   friendInfo(friendName: "Малыш", friendAvatar: UIImage(named: "kid")!),
                   friendInfo(friendName: "Шерлок", friendAvatar: UIImage(named: "House")!),
                   friendInfo(friendName: "Вигго",   friendAvatar: UIImage(named: "dizel")!),
                   friendInfo(friendName: "Джек", friendAvatar: UIImage(named: "Jack")!),
                   friendInfo(friendName: "Сара", friendAvatar: UIImage(named: "riana")!),
                   friendInfo(friendName: "Йенифер", friendAvatar: UIImage(named: "kid")!)
    ]
    
    var sections: [Character: [String]] = [:]
    var sectionTitles: [Character] = []
    
    mutating func fillSections() -> Void {
        for friend in friends {
            let firstLetter = friend.friendName.first!
            if sections[firstLetter] != nil {
                sections[firstLetter]?.append(friend.friendName)
            }
            else {
                sections[firstLetter] = [friend.friendName]
            }
        }
        sectionTitles = Array(sections.keys)
        sectionTitles.sort()
    }
}

class TableFriendsViewController: UIViewController, UISearchBarDelegate {
    
    var sections:[Character: [String]] = [:]
    var sectionTitles: [Character] = []
    
    var filteredSections: [Character: [String]] = [:]
    var filteredSectionTitles: [Character] = []
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        searchBar.delegate = self
        
        var friendsData = FriendData()
        friendsData.fillSections()
        sections = friendsData.sections
        sectionTitles = friendsData.sectionTitles
        
        filteredSections = sections
        filteredSectionTitles = sectionTitles
    }
    
    @IBAction func SelectedRawUpdate(_ sender: Any) {
        
        let selday = (sender as! NameListPicker).selectedDay
        
        let numberOfSections = tableview.numberOfSections
        let numberOfRows = tableview.numberOfRows(inSection: numberOfSections-1)
        
        if numberOfRows > 0 {
            guard let row = sectionTitles.firstIndex(of: selday!)else {return}
            let indexPath = NSIndexPath(row: 0, section: row)
            tableview.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "showFriendPage",
            let cell = sender as? UserCell,
            let destination = segue.destination as? FriendViewController {
            destination.friendImage = cell.friendImage.image
            destination.friendtitle = cell.friendNameLabel.text
        }
    }
}

extension TableFriendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSections[filteredSectionTitles[section]]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredSectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(sectionTitles[section])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell else { fatalError()}
        
        guard let city = filteredSections[filteredSectionTitles[indexPath.section]]?[indexPath.row]
            else {
                fatalError()
        }
        cell.friendNameLabel.text = city
        cell.friendImage.image = UIImage(named: "House")!
        return cell
    }
    
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredSections = [:]
        filteredSectionTitles = []
        
        if searchText == "" {
            filteredSections = sections
            filteredSectionTitles = sectionTitles
        }
        else {
            for currentSection in sections {
                for friendInSection in currentSection.value {
                    if friendInSection.lowercased().contains(searchText.lowercased()) {
                        let firstLetter = friendInSection.first!
                        if filteredSections[firstLetter] != nil {
                            filteredSections[firstLetter]?.append(friendInSection)
                        }
                        else {
                            filteredSections[firstLetter] = [friendInSection]
                        }
                    }
                    filteredSectionTitles = Array(filteredSections.keys)
                }
            }
        }
        self.tableview.reloadData()
    }
}


extension TableFriendsViewController: UITableViewDelegate {
    
}
