//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by ERIC SMITH on 5/3/20.
//  Copyright © 2020 ERIC SMITH. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    func createToDos() -> [ToDo] {

      let swift = ToDo()
      swift.name = "Learn Swift"
      swift.important = true

      let dog = ToDo()
      dog.name = "Walk the Dog"
      // important is set to false by default

      return [swift, dog]
    }
    
    var toDos : [ToDo] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "universe.jpg")!)

        toDos = createToDos()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // dont delete
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        
        if toDo.important {
          cell.textLabel?.text = "❗️" + toDo.name
        } else {
          cell.textLabel?.text = toDo.name
        }


        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let toDo = toDos[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController {
        addVC.previousVC = self
    }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
          if let toDo = sender as? ToDo {
            completeVC.selectedToDo = toDo
            completeVC.previousVC = self
          }
        }
    }
   
}
