//
//  Session.swift
//  cloneVK
//
//  Created by Alexander Kokh on 24.09.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

class Session {
   
    var token: String = ""
    var userId: Int = 0
    static let instance = Session()
    
    private init() {}
   
}
