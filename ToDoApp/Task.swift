//
//  Task.swift
//  TodoApp
//
//  Created by User on 2/19/19.
//  Copyright © 2019 User. All rights reserved.
//

struct Task {
  var title: String
  var note: String?
  var done: Bool = false

  init(title: String, note: String?, done: Bool = false) {
    self.title = title
    self.note = note
    self.done = done
  }
}
