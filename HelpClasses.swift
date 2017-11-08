//
//  HelpClasses.swift
//  TinderDemo
//
//  Created by Shiffa Khurana on 08/11/17.
//  Copyright © 2017 IOS Freelancer. All rights reserved.
//
import RealmSwift
import Foundation
class UserList:  Object{
  /*  dynamic var status: Int = 0
    private dynamic var applied_for: String = ""
    
    private dynamic var category_type_id: Int = 0
    dynamic var chinese_name: String = ""
    dynamic var category_icon_string: String = ""
    private dynamic var typeInteger: Int = 0
    private dynamic var type: String = "" */
    dynamic var name: String = ""
    dynamic var imageLink: String = ""
    dynamic var skillType: String = ""
    dynamic var gender: String = ""
    //     var userType: AccountType = .Individual
       
    override static func primaryKey() -> String? {
        return "name"
    }
    
}
