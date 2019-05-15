import Foundation

class Task: Codable{
    var taskContent:String?
    var taskCompleted:Bool?
    
    init(taskContent:String, taskCompleted:Bool) {
        self.taskContent = taskContent
        self.taskCompleted = taskCompleted
    }
    
    func setTaskComplete(State:Bool){
        self.taskCompleted = State
    }
    
}
