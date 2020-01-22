//
//  DAO.swift
//  TestRest
//
//  Created by ontlener on 22/01/2020.
//  Copyright © 2020 EhB. All rights reserved.
//

import Foundation

class DAO{
    //Singleton
    static var sharedInstance:DAO = DAO.init()
    private init(){}
    
    func getAllPosts() ->[Post]{
        var posts = [Post]()
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts")
        
        do{
            //ruwe data uit adres halen
            let data = try Data.init(contentsOf: url!)
            //root element was een array
            let jsonArray = try JSONSerialization.jsonObject(with: data) as! [NSObject]
            
            for item in jsonArray{
                let userIDT = item.value(forKey: "userId") as! Int
                let id = item.value(forKey: "id") as! Int
                let title = item.value(forKey: "title") as! String
                let body = item.value(forKey: "body") as! String
                
                let post = Post.init(userID: userIDT, id: id, title: title, body: body)
                posts.append(post)
            }
            
        }catch{
            print("kapot")
        }
        return posts
    }
    
    func userByID(userId:Int) -> User{
        let uri = URL(string: "https://jsonplaceholder.typicode.com/users/\(userId)")
        do{
            let jsonData = try Data(contentsOf: uri!)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData) as! NSObject
            
            let userName = jsonObject.value(forKey: "username") as! String
            
            let user = User.init(userID: userId, userName: userName)
            return user
        }catch{
            print("\'t werkt ni")
        }
        return User.init(userID: -404, userName: "Not found")
    }
}
