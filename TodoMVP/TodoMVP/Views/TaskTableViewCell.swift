//
//  TaskTableViewCell.swift
//  TodoMVP
//
//  Created by Yoshinori Imajo on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import UIKit

protocol TaskTableViewCellDelegate: class {
    func didChangeDoneState(to done: Bool, taskId: String)
}

class TaskTableViewCell: UITableViewCell {

    var taskId: String!
    weak var delegate: TaskTableViewCellDelegate?

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskContentLabel: UILabel!
    private var done: Bool = false {
        didSet {
            doneButton.setTitle(done ? "☑" : "□", for: .normal)
            delegate?.didChangeDoneState(to: done, taskId: taskId)
        }
    }

    @IBAction func doneTask(_ sender: Any) {
        done = !done
    }
}
