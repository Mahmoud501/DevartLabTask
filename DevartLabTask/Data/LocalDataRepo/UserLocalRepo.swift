//
//  UserLocalRepo.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation

class UserLocalRepo: UserRepo {
    
    let repo = CoreDataRepository<User>()
    
    func insertUser(request: UserRepoInOut.Insert.Request?, response: ((UserRepoInOut.Insert.Response?) -> ())?) {
        let user = User.init(context: repo.context!)
        user.id = Int32((request?.id)!)
        user.name = request?.name
        user.salary  = request?.salary ?? 0
        var res = UserRepoInOut.Insert.Response()
        do {
            try repo.context?.save()
            res.user = UserModel.init(user: user)
            res.message = "Successfully insert user"
            response?(res)
        } catch let error {
            res.user = nil
            res.message = "Failed insert User" + " " + error.localizedDescription
            response?(res)
        }
    }
    
    func updateUser(request: UserRepoInOut.Update.Request?, response: ((UserRepoInOut.Update.Response?) -> ())?) {
        var res = UserRepoInOut.Update.Response()
        if let user = repo.query(with: "id == \(request!.id!)")?.first {
            user.name = request?.name
            user.salary  = request?.salary ?? 0
            do {
                try repo.context?.save()
                res.user = UserModel.init(user: user)
                res.message = "Successfully insert user"
                response?(res)
            } catch let error {
                res.user = nil
                res.message = "Failed update User" + " " + error.localizedDescription
                response?(res)
            }
        }else {
            res.user = nil
            res.message = "user not found"
            response?(res)
        }
        
    }
    
    func deleteUser(request: UserRepoInOut.Delete.Request?, response: ((UserRepoInOut.Delete.Response?) -> ())?) {
        var res = UserRepoInOut.Delete.Response()
        if let user = repo.delete(with: "id == \(request!.id!)")?.first {
            do {
                try repo.context?.save()
                res.user = UserModel.init(user: user)
                res.message = "Successfully delete user"
                response?(res)
            } catch let error {
                res.user = nil
                res.message = "Failed delete User" + " " + error.localizedDescription
                response?(res)
            }
        }else {
            res.user = nil
            res.message = "user not found"
            response?(res)
        }
    }
    
    func getAllUser(request: UserRepoInOut.GetAll.Request?, response: ((UserRepoInOut.GetAll.Response?) -> ())?) {
        let users = repo.getAll()
        let usersModel = users?.map{ return UserModel.init(user: $0)}
        var res = UserRepoInOut.GetAll.Response()
        res.users = usersModel
        res.message = "Successfully get all users"
        response?(res)
    }
    
}
