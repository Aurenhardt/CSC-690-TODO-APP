//
//  ViewController.swift
//  TODO App CSC690
//
//  Created by Christian Gomez on 4/7/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import UIKit

//var tasks:[Task] = []
//var selectedIndex = 0
let storage = UserDefaults.standard
//let endcodeDecode = EncodeDecodeClassModel()
let Model = EncodeDecodeClassModel()


protocol TaskManagerDelegate{
    func sendInput(Item:Task)
}

class TaskManager: TaskManagerDelegate{
    func sendInput(Item: Task) {
        print("tacos")
    }
    
}

class TasksMainViewController: UIViewController,UITableViewDelegate {

    
    
    @IBOutlet weak var tableView: UITableView!
    let taskDelegate = TaskManager()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tasks.popLast()
        //tasks.append(Task(taskContent: "Buy Tacos", taskCompleted: true))
        
        Model.appendTask(input:(Task(taskContent: "Buy Tacos", taskCompleted: true)))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.viewWillAppear(true)
   
        //endcodeDecode.DecodeTasks()
        Model.DecodeTasks()
        
        self.viewWillAppear(true)
        
       //Model.printTasksArray()
        self.tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            //endcodeDecode.DecodeTasks()
            Model.DecodeTasks()
            self.tableView.reloadData()
        }
        
    }
    

}

extension TasksMainViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return tasks.count
        return Model.getTaskCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let taskArray = tasks[indexPath.row]
        let cell = UITableViewCell()
        //cell.textLabel?.text = tasks[indexPath.row].taskContent
        
        cell.textLabel?.text = Model.getTask(index: indexPath.row).taskContent
        
        /*
        if tasks[indexPath.row].taskCompleted == true {
            cell.backgroundColor = UIColor.green
        }else{
            cell.backgroundColor = .white
        }*/
        
        if Model.getTask(index: indexPath.row).taskCompleted == true{
            cell.backgroundColor = UIColor.green
        }else{
            cell.backgroundColor = .white
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectedIndex = indexPath.row
        Model.setIndex(input: indexPath.row)
        performSegue(withIdentifier: "EditSegue", sender: self)
    
    }
    
    
    
    
    
}
