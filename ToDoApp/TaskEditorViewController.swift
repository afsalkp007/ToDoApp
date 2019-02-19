//
//  TaskEditorViewController.swift
//  TodoApp
//
//  Created by User on 2/19/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class TaskEditorViewController: UIViewController {

  @IBOutlet var titleInput: UITextField!
  @IBOutlet var textView: UITextView!

  var didAddHandler: ((Task) -> Void)?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.textView.layer.cornerRadius = 5
    self.textView.layer.borderColor = UIColor.lightGray.cgColor
    self.textView.layer.borderWidth = 1 / UIScreen.main.scale
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.titleInput.becomeFirstResponder()
  }

  @IBAction func cancelButtonDidTap() {
    self.titleInput.resignFirstResponder()
    self.dismiss(animated: true, completion: nil)

  }

  @IBAction func doneButtonDidTap() {
    guard let title = self.titleInput.text, !title.isEmpty else {
      return
    }

    self.titleInput.resignFirstResponder()

    let newTask = Task(title: title, note: self.textView.text)
    self.didAddHandler?(newTask)
    self.dismiss(animated: true, completion: nil)
  }


}
