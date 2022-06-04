//
//  UserPresenter.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation

class UserPresenter: UserListDataSource, UserListBuninessLogic {
    
    var storage: AppStorage?
    var users: [UserModel]?
    weak var userView: UserListView?
    
    init() {}
    //dependency injection
    init(storage: AppStorage? = nil, userView: UserListView? = nil) {
        self.storage = storage ?? AppStorage.init(type: .demo)
        self.userView = userView
    }
    
    
    
    func getAllUser() {
        storage?.userRepo?.getAllUser(request: nil, response: { [weak self] response in
            guard let self = self else { return }
            if let err = response?.error {
                self.userView?.showError(err: err.desc)
            }else {
                self.users = response?.users
                self.userView?.didGetAllUser()
                if (self.users?.count ?? 0) == 0 {
                    self.userView?.EmptyUsers()
                }
            }
        })
    }
    
    func deleteUser(request: UserRepoInOut.Delete.Request?) {
        storage?.userRepo?.deleteUser(request: request, response: { [weak self] response in
            guard let self = self else { return }
            if let err = response?.error {
                self.userView?.showError(err: err.desc)
            }else {
                let users = self.users?.filter{ $0.id != request?.id}
                self.users = users
                self.userView?.didDeleteUser(user: response?.user)
                if (self.users?.count ?? 0) == 0 {
                    self.userView?.EmptyUsers()
                }
            }
        })
    }
    
    func insertUser(request: UserRepoInOut.Insert.Request?) {
        storage?.userRepo?.insertUser(request: request, response: { [weak self] response in
            guard let self = self else { return }
            if let err = response?.error {
                self.userView?.showError(err: err.desc)
            }else {
                if self.users == nil {
                    self.users = []
                }
                if let user = response?.user {
                    self.users?.append(user)
                }
                self.userView?.didInsertUser(user: response?.user)
            }
        })
    }
    
    func update(request: UserRepoInOut.Update.Request?) {
        storage?.userRepo?.updateUser(request: request, response: { [weak self] response in
            guard let self = self else { return }
            if let err = response?.error {
                self.userView?.showError(err: err.desc)
            }else {
                let existUser = self.users?.filter{ $0.id == request?.id}.first
                existUser?.name = request?.name
                existUser?.salary = request?.salary
                self.userView?.didUpdateUser(user: response?.user)
            }
        })
    }
    
    func validationUser(name: String?, salary: Double?) -> Bool {
        return  (((name ?? "") != "") && ((salary ?? 0) != 0))
    }
}
