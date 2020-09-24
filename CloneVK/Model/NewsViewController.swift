//
//  NewsViewController.swift
//  cloneVK
//
//  Created by Alexander Kokh on 27.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

struct userNews {
    
    var iconNews: UIImage
    var nameNews: String
    var timeAdd: String
    var descriptionNews: String
    var mainPhotoNews: UIImage
    var countLike: Int
    var countComments: Int
    var countTwits: Int
    var countViews: Int
}

class TableNewsViewController: UIViewController {
    
    var randownews = [userNews(iconNews: UIImage(named: "IOS developers")!, nameNews: "IOS Developer", timeAdd: "40 минут назад", descriptionNews: "iOS — мобильная операционная система, которая не нуждается в представлении. Это продвинутое творение компании Apple используется на миллионах iOS-устройств по всему миру, и популярность ее с каждым днем растет. И это неудивительно, ведь удобная платформа iOS позволяет разработчикам писать качественный код для создания самых инновационных мобильных приложений для iPhone, iPad и iPod. (и самых смелых идей.)", mainPhotoNews: UIImage(named: "IOS developers")!, countLike: Int.random(in: 0...100), countComments: Int.random(in: 0...50), countTwits: Int.random(in: 0...50), countViews: Int.random(in: 1...10000)),
                      userNews(iconNews: UIImage(named: "swift")!, nameNews: "swift", timeAdd: "40 минут назад",descriptionNews: "iOS — мобильная операционная система, которая не нуждается в представлении.)", mainPhotoNews: UIImage(named: "swift")!, countLike: Int.random(in: 0...100), countComments: Int.random(in: 0...50), countTwits: Int.random(in: 0...50), countViews: Int.random(in: 1...10000))
    ]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }
}

extension TableNewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randownews.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell2") as? NewsCell else { fatalError() 
        }
        
        let currentNews = randownews[indexPath.row]
        cell.labelNameNews.text = currentNews.nameNews
        cell.labelMainPhotoNews.image = currentNews.mainPhotoNews
        cell.labelIconNews.image = currentNews.iconNews
        cell.labelDescriptionNews.text = currentNews.descriptionNews
        cell.labelCountViews.text = String(currentNews.countViews)
        cell.labelCountTwits.text = String(currentNews.countTwits)
        cell.labelCountLike.text = String(currentNews.countLike)
        cell.labelCountComments.text = String(currentNews.countComments)
        return cell
    }
}

extension TableNewsViewController: UITableViewDelegate {
    
}
