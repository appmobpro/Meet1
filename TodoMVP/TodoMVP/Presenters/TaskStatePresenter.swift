//
//  TaskStatePresenter.swift
//  TodoMVP
//
//  Created by hiralin on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import Foundation

final class TaskStatePresenter {
    private var taskEntity: TaskEntity
    private let taskRepository = TaskRepository()

    let taskId: String
    
    init(taskId: String) {
        self.taskId = taskId
        taskEntity = taskRepository.findById(taskId)!
    }
    
    var done: Bool = false {
        didSet {
            taskRepository.add(entity: taskEntity,
                               update: true,
                               operation: {[done](entity) in
                                entity.done = done
            })
        }
    }
}
