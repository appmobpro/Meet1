//
//  TasksPresenter.swift
//  TodoMVP
//
//  Created by Yoshinori Imajo on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import Foundation

final class TasksPresenter {

    private let taskRepository = TaskRepository()
    
    var taskCount: Int {
        return taskRepository.count
    }

    func task(_ index: Int) -> TaskEntity {
        let tasks = taskRepository.findByAll()
        return tasks[index]
    }
}
