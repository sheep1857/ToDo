//
//  File.swift
//  ToDo
//
//  Created by 木村美希 on 2023/02/20.
//

import Foundation
import RealmSwift

class TodoList: Object {
    @Persisted var title: String = ""
    @Persisted var content: String = ""
    @Persisted var date: String!
}
