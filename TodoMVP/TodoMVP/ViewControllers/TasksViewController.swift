//
//  TasksViewController.swift
//  TodoMVP
//
//  Created by Yoshinori Imajo on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let tasksPresenter = TasksPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "タスク一覧: \(tasksPresenter.taskCount)"
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksPresenter.taskCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TaskTableViewCell

        let task = tasksPresenter.task(indexPath.row)
        cell.taskTitleLabel.text = task.title
        cell.taskContentLabel.text = task.content
        cell.taskId = task.id
        cell.done = task.done
        cell.delegate = self
        return cell
    }



}

extension TasksViewController: TaskTableViewCellDelegate {
    func didChangeDoneState(to done: Bool, taskId: String) {
        let taskStatePresenter = TaskStatePresenter(taskId: taskId)
        taskStatePresenter.done = done
    }
}
