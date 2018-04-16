//
//  RepositoryProtocol.swift
//  TodoMVP
//
//  Created by hiralin on 2018/04/14.
//  Copyright © 2018年 Yoshinori Imajo. All rights reserved.
//

import Foundation

protocol RepositoryProtocol {
    associatedtype EntityType
    
    var count: Int { get }
    func findById(_ id: String) -> EntityType?
    func findByAll() -> [EntityType]
    func add(entity: EntityType, update: Bool, operation: ((_ entity: EntityType) -> Void)?)
}
