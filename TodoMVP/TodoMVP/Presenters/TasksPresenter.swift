//
//  TasksPresenter.swift
//  TodoMVP
//
//  Created by Yoshinori Imajo on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import Foundation
import RealmSwift

final class TasksPresenter {

    let realm = try! Realm()

    lazy var tasks = realm.objects(TaskEntity.self)

    var taskCount: Int {
        return tasks.count
    }

    func task(_ index: Int) -> TaskEntity {
        return tasks[index]
    }
}
