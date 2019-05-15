//
//  EditTaskViewController.swift
//  TODO App CSC690
//
//  Created by Christian Gomez on 4/8/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController {

    @IBOutlet weak var markedCompleteButton: UIButton!
    @IBOutlet weak var userInputText: UITextView!
    @IBOutlet weak var cancelEditingButton: UIButton!
    @IBOutlet weak var doneEditingButton: UIButton!
    @IBOutlet weak var deleteTaskButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userInputText.text = tasks[selectedIndex]
        //userInputText.text = tasks[selectedIndex].taskContent
        
        userInputText.text = Model.getTask(index: Model.getIndex()).taskContent
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        userInputText.becomeFirstResponder()
        
    }
    
    @IBAction func markedCompleteButtonTapped(_ sender: Any) {
        //tasks[selectedIndex].setTaskComplete(State:true)
        Model.getTask(index: Model.getIndex()).setTaskComplete(State: true)
        
        //endcodeDecode.EncodeTasks()
        Model.EncodeTasks()
        dismiss(animated:true)
    }
    
    @IBAction func cancelEditingButtonTapped(_ sender: Any) {
        dismiss(animated:true)
    }
    
    @IBAction func doneEditingButtonTapped(_ sender: Any) {
        //tasks[selectedIndex] = userInputText.text
        //tasks[selectedIndex] = Task(taskContent:userInputText.text,taskCompleted: false)
        
        Model.setTask(index: Model.getIndex(), newTask: Task(taskContent: userInputText.text, taskCompleted: false))
        
        Model.EncodeTasks()
        //endcodeDecode.EncodeTasks()
        //print(tasks)
        dismiss(animated:true)
    }
    
    @IBAction func deleteTaskButtonTapped(_ sender: Any) {
        //tasks.remove(at: selectedIndex)
        
        Model.removeTask(index: Model.getIndex())
        Model.EncodeTasks()
        //endcodeDecode.EncodeTasks()
        dismiss(animated: true) 
    }
    
    @objc func keyboardWillShow(with notification: Notification){
        let key = "UIKeyboardFrameEndUserInfoKey"
        guard let keyboardFrame = notification.userInfo?[key] as? NSValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        bottomConstraint.constant=keyboardHeight
        
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
