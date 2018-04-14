//
//  TodoMVPTests.swift
//  TodoMVPTests
//
//  Created by Yoshinori Imajo on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import XCTest
import RealmSwift
@testable import TodoMVP

class TodoMVPTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTaskEntity() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }

        let entity = TaskEntity()

        try! realm.write {
            entity.title = "1"
            realm.add(entity, update: true)
        }

        // データとってきて1になってたら
        let tasks = realm.objects(TaskEntity.self)
        XCTAssertEqual(tasks.count, 1)
        XCTAssertEqual(tasks.first!.title, "1")

        try! realm.write {
            entity.title = "2"
            realm.add(entity, update: true)
        }

        XCTAssertEqual(tasks.count, 1)
        XCTAssertEqual(tasks.first!.title, "2")

        try! realm.write {
            realm.deleteAll()
        }
    }

    func testEditPresenter() {

        let taskEditPresenter = TaskEditPresenter()
        taskEditPresenter.title = "1"
        taskEditPresenter.content = "c1"

        let tasksPresenter = TasksPresenter()
        XCTAssertEqual(tasksPresenter.taskCount, 1)
        let task = tasksPresenter.task(0)
        
        XCTAssertFalse(task.done)
        XCTAssertEqual(task.title, "1")
        XCTAssertEqual(task.content, "c1")

        taskEditPresenter.title = "2"
        taskEditPresenter.content = "c2"

        XCTAssertEqual(tasksPresenter.taskCount, 1)
        XCTAssertEqual(task.title, "2")
        XCTAssertEqual(task.content, "c2")
        
        let taskStatePresenter = TaskStatePresenter(taskId: task.id)
        taskStatePresenter.done = true
        XCTAssertTrue(task.done)
        
        taskStatePresenter.done = false
        XCTAssertFalse(task.done)
    }
    
    func testTaskStatePresenter() {
        
    }

}






