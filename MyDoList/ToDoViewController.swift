//
//  ViewController.swift
//  MyDoList
//
//  Created by Anupama Mac on 10/20/18.
//  Copyright © 2018 Anupama Mac. All rights reserved.
//

import UIKit



class ToDoViewController: UITableViewController {
  var itemArray = ["call mondisory", "second", "third"]
  var defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "todolist") as? [String]
        {
            itemArray = items
        }
        else
        {
            print("no list")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print(indexPath.row)
        print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark
        {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        else
        {
           tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Do", message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Add New Do", style: .default) { (alertAction) in
            if let newItem = textField.text {
                self.itemArray.append(newItem)
                self.defaults.set(self.itemArray, forKey: "todolist")
                self.tableView.reloadData()
        }
        else
            {
                print("No item added")
            }
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "add new item"
             textField = alertTextField
            }
            
       
       
        alert.addAction(alertAction)
        present(alert, animated: true , completion: nil)
        
        
        
    }

    
    
}

