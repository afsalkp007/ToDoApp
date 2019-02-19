//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by User on 2/19/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var didAddHandler: ((TodoList) -> Void)?
    
    @IBAction func addListItemAction(_ sender: Any) {
        
        let title = titleTextField.text!
        let content = contentTextView.text ?? ""
        
        let item: TodoList = TodoList(title: title, content: content)
        
        print("Add List title : \(item.title)")
        if !title.isEmpty {
            list.append(item)
        }
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contentTextView.layer.borderColor = UIColor.gray.cgColor
        contentTextView.layer.borderWidth = 0.3
        contentTextView.layer.cornerRadius = 2.0
        contentTextView.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
