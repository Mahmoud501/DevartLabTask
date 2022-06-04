//
//  UserRepo.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation

protocol UserRepo: AnyObject {
    
    func insertUser(request: UserRepoInOut.Insert.Request?, response: ((UserRepoInOut.Insert.Response?)->())?)
    func updateUser(request: UserRepoInOut.Update.Request?, response: ((UserRepoInOut.Update.Response?)->())?)
    func deleteUser(request: UserRepoInOut.Delete.Request?, response: ((UserRepoInOut.Delete.Response?)->())?)
    func getAllUser(request: UserRepoInOut.GetAll.Request?, response: ((UserRepoInOut.GetAll.Response?)->())?)

}
