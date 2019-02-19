//
//  TodoList.swift
//  TodoList
//
//  Created by User on 2/19/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation

struct TodoList {
    var title: String = ""
    var content: String?
    var isComplete: Bool = false
    
    init(title: String, content: String?, isComplete: Bool = false) {
        self.title = title
        self.content = content
        self.isComplete = isComplete
    }
}
