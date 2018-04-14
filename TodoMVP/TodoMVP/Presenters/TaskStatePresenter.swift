//
//  TaskStatePresenter.swift
//  TodoMVP
//
//  Created by hiralin on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import Foundation
import RealmSwift

final class TaskStatePresenter {
    private let realm = try! Realm()
    private var taskEntity: TaskEntity

    let taskId: String
    
    init(taskId: String) {
        self.taskId = taskId
        taskEntity = realm.object(ofType: TaskEntity.self, forPrimaryKey: taskId)!
    }
    
    var done: Bool = false {
        didSet {
            try! realm.write {
                taskEntity.done = done
                realm.add(taskEntity, update: true)
            }
        }
    }
}
