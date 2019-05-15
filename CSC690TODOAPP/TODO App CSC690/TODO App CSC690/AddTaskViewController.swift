//
//  AddTaskViewController.swift
//  TODO App CSC690
//
//  Created by Christian Gomez on 4/8/19.
//  Copyright © 2019 Christian Gomez. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var userInputText: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        userInputText.becomeFirstResponder()//Got this from a tutorial to make it look nice.

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
    }//Got this from a tutorial to make it look nice.
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    

    @IBAction func doneButtonTapped(_ sender: Any) {
        //tasks.append(Task(taskContent: userInputText.text, taskCompleted: false))
        var temp = Task(taskContent: userInputText.text, taskCompleted: false)
        Model.appendTask(input: temp)
        Model.EncodeTasks()
        //endcodeDecode.EncodeTasks()
        
        //print("Tasks: \(Model.getTask(index: 0).taskContent)")
        Model.printTasksArray()
        
        dismiss(animated:true)
    }
 

}
