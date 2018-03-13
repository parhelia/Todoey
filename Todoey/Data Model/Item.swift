//
//  Item.swift
//  Todoey
//
//  Created by ET on 2018-03-13.
//  Copyright © 2018 ET. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?

    var parentCategory = LinkingObjects(fromType: Category.self, property: "items") //look in the Category class file for the forward relationship
}
