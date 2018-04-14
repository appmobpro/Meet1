//
//  TaskTableViewCell.swift
//  TodoMVP
//
//  Created by Yoshinori Imajo on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskContentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func doneTask(_ sender: Any) {
        doneButton.setTitle("☑", for: .normal)
    }
}
