//
//  TaskEditViewController.swift
//  TodoMVP
//
//  Created by Yoshinori Imajo on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import UIKit

class TaskEditViewController: UITableViewController {

    let taskEditPresenter = TaskEditPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func editingChangedTitle(_ sender: UITextField) {

        taskEditPresenter.title = sender.text ?? ""
    }

    @IBAction func editingChangedContent(_ sender: UITextField) {

        taskEditPresenter.content = sender.text ?? ""

    }
}
