//
//  Category.swift
//  Todoey
//
//  Created by ET on 2018-03-13.
//  Copyright © 2018 ET. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    let items = List<Item>() //forward relationship
}
