//
//  UserListProtocol.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation

protocol UserListDataSource {
    
    var users: [UserModel]? { get set}
    
}

protocol UserListBuninessLogic {
    
    func validationUser(name: String?, salary: Double?) -> Bool
    func getAllUser()
    func deleteUser(request: UserRepoInOut.Delete.Request?)
    func insertUser(request: UserRepoInOut.Insert.Request?)
    func update(request: UserRepoInOut.Update.Request?)
    
}

protocol UserListView: AnyObject {
    
    func didGetAllUser()
    func EmptyUsers()
    func didInsertUser(user: UserModel?)
    func didUpdateUser(user: UserModel?)
    func didDeleteUser(user: UserModel?)
    func showError(err: String?)
    
}
