//
//  TaskRepository.swift
//  TodoMVP
//
//  Created by hiralin on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import Foundation
import RealmSwift

class TaskRepository: RepositoryProtocol {
    
    let realm = try! Realm()
    
    var count: Int {
        return realm.objects(TaskEntity.self).count
    }
    
    func findById(_ id: String) -> TaskEntity? {
        return realm.object(ofType: TaskEntity.self, forPrimaryKey: id)
    }
    
    func findByAll() -> [TaskEntity] {
        return realm.objects(TaskEntity.self).map{$0}
    }
    
    func add(entity: TaskEntity, update: Bool, operation: ((_ entity: TaskEntity) -> Void)?) {
        try! realm.write {
            operation?(entity)
            realm.add(entity, update: update)
        }
    }
}
