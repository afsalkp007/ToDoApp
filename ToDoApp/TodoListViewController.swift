//
//  ViewController.swift
//  TodoList
//
//  Created by User on 2/19/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

var list = [TodoList]()

class TodoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var todoListTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTap))
    
    @objc
    func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = editButton
        todoListTableView.setEditing(false, animated: true)
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        guard !list.isEmpty else {
            return
        }
        self.navigationItem.leftBarButtonItem = doneButton
        todoListTableView.setEditing(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoListTableView.delegate = self
        todoListTableView.dataSource = self
        
        loadAllData()
        print(list.description)
        
        doneButton.style = .plain
        doneButton.target = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        saveAllData()
        todoListTableView.reloadData()
    }
    
    func saveAllData() {
        let data = list.map {
            [
                "title": $0.title,
                "content": $0.content!,
                "isComplete": $0.isComplete
            ]
        }
        
        //print(type(of: data))
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "items")
        userDefaults.synchronize()
    }
    
    func loadAllData() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "items") as? [[String: AnyObject]] else {
            return
        }
        
        //print(data.description)
        
        //print(type(of: data))
        list = data.map {
            let title = $0["title"] as? String
            let content = $0["content"] as? String
            let isComplete = $0["isComplete"] as? Bool
            
            return TodoList(title: title!, content: content!, isComplete: isComplete!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row].title
        cell.detailTextLabel?.text = list[indexPath.row].content
        if list[indexPath.row].isComplete {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        todoListTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !list[indexPath.row].isComplete {
            list[indexPath.row].isComplete = true
        } else {
            list[indexPath.row].isComplete = false
        }

        todoListTableView.reloadData()
    }
    
}

