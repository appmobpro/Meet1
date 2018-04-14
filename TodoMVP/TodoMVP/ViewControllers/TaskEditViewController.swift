//
//  TaskEditViewController.swift
//  TodoMVP
//
//  Created by Yoshinori Imajo on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import UIKit

class TaskEditViewController: UITableViewController {

    @IBOutlet weak var titleTextFiled: UITextField!
    @IBOutlet weak var contentTextField: UITextField!

    var taskId: String?
    private var taskEditPresenter: TaskEditPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        taskEditPresenter = TaskEditPresenter(taskId: taskId)
        titleTextFiled.text = taskEditPresenter.taskEntity.title
        contentTextField.text = taskEditPresenter.taskEntity.content
    }
    
    @IBAction func editingChangedTitle(_ sender: UITextField) {
        taskEditPresenter.updateTitle(title: sender.text ?? "")
    }

    @IBAction func editingChangedContent(_ sender: UITextField) {
        taskEditPresenter.updateContent(content: sender.text ?? "")
    }
}
