//
//  TaskEditPresenter.swift
//  TodoMVP
//
//  Created by Yoshinori Imajo on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import Foundation
import RealmSwift

final class TaskEditPresenter {

    let realm = try! Realm()
    var taskEntity:TaskEntity

    init(taskId: String?) {
        if let taskId = taskId {
            taskEntity = realm.object(ofType: TaskEntity.self, forPrimaryKey: taskId) ?? TaskEntity()
        }else {
            taskEntity = TaskEntity()
        }
    }

    func updateTitle(title: String) {
        if title.isEmpty {
            try! realm.write {
                realm.delete(taskEntity)
            }
            taskEntity = TaskEntity()
        } else {
            try! realm.write {
                taskEntity.title = title
                realm.add(taskEntity, update: true)
            }
        }
    }
    
    func updateContent(content: String) {
        try! realm.write {
            taskEntity.content = content
            realm.add(taskEntity, update: true)
        }
    }
    
}

