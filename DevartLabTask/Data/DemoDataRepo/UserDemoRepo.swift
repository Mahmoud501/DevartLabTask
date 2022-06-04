//
//  UserDemoRepo.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation

class UserDemoRepo: UserRepo {
    
    
    func insertUser(request: UserRepoInOut.Insert.Request?, response: ((UserRepoInOut.Insert.Response?) -> ())?) {
        let user = UserModel()
        user.id = Int.random(in: 1..<100000)
        user.salary = request?.salary
        user.name = request?.name
        var res = UserRepoInOut.Insert.Response()
        res.user = user
        res.message = "Successfully insert user"
        response?(res)
    }
    
    func updateUser(request: UserRepoInOut.Update.Request?, response: ((UserRepoInOut.Update.Response?) -> ())?) {
        let user = UserModel()
        user.id = request?.id
        user.salary = request?.salary
        user.name = request?.name
        var res = UserRepoInOut.Update.Response()
        res.user = user
        res.message = "Successfully update user"
        response?(res)
    }
    
    func deleteUser(request: UserRepoInOut.Delete.Request?, response: ((UserRepoInOut.Delete.Response?) -> ())?) {
        let user = UserModel()
        user.id = request?.id
        var res = UserRepoInOut.Delete.Response()
        res.user = user
        res.message = "Successfully delete user"
        response?(res)
    }
    
    func getAllUser(request: UserRepoInOut.GetAll.Request?, response: ((UserRepoInOut.GetAll.Response?) -> ())?) {
        let user1 = UserModel()
        user1.id = 1
        user1.name = "Mahmoud"
        user1.salary = 1200
        
        let user2 = UserModel()
        user2.id = 1
        user2.name = "Ahmed"
        user2.salary = 1800
        
        let user3 = UserModel()
        user3.id = 1
        user3.name = "Mohmmed"
        user3.salary = 1100
        
        let user4 = UserModel()
        user4.id = 1
        user4.name = "Zaki"
        user4.salary = 1000
        
        let user5 = UserModel()
        user5.id = 1
        user5.name = "Eldeep"
        user5.salary = 900
        
        var res = UserRepoInOut.GetAll.Response()
        res.users = [user1, user2, user3, user4, user5]
        res.message = "Successfully get all users"
        response?(res)
    }

    
}
