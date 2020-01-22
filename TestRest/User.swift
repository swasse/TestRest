//
//  User.swift
//  TestRest
//
//  Created by ontlener on 22/01/2020.
//  Copyright © 2020 EhB. All rights reserved.
//

import Foundation
public class User{
    
    var userID:Int
    var userName:String
    
    init(userID:Int, userName:String) {
        self.userID = userID
        self.userName = userName
    }
}
