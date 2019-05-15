//
//  EncodeDecodeClass.swift
//  TODO App CSC690
//
//  Created by Christian Gomez on 4/8/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import Foundation

class EncodeDecodeClassModel{
    
    var TasksArray:[Task] = []
    var TaskIndex: Int = 0
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func EncodeTasks(){
        if let todoData = try? encoder.encode(self.TasksArray) {
            storage.set(todoData, forKey: "ToDos")
        }
    }
    
    func DecodeTasks(){
        if
            let storedTaskData = storage.data(forKey: "ToDos"),
            let tasksFromStorage = try? decoder.decode(Array<Task>.self, from: storedTaskData)
        {
            self.TasksArray = tasksFromStorage
        }
        
    }
    
    func getTask(index: Int)->Task{
        return self.TasksArray[index]
    }
    
    func appendTask(input: Task){
        self.TasksArray.append(input)
    }
    
    func removeTask(index: Int){
        self.TasksArray.remove(at: index)
    }
    
    func setTask(index:Int, newTask: Task){
        self.TasksArray[index] = newTask
    }
    
    func setIndex(input: Int){
        self.TaskIndex = input
    }
    
    func getIndex()->Int{
        return self.TaskIndex
    }
    
    func getTaskCount()->Int{
        return self.TasksArray.count
        
    }
    
    func printTasksArray(){
        for i in TasksArray {
            print(i.taskContent)
        }
        
    }
    
}
