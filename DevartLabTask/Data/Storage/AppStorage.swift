//
//  AppStorage.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation

class AppStorage {
    
    static var generalType: StorageType = .demo {
        didSet {
            print("warning: Repo Type Did Set to ########################### ",generalType)
        }
    }
    private var type: StorageType = .demo
    var userRepo: UserRepo?
    
    init(type: StorageType = AppStorage.generalType) {
        self.type = type
        if type == .local {
            userRepo = UserLocalRepo()
        }else if type == .demo {
            userRepo = UserDemoRepo()
        }
    }
    
    func getCurrentType() -> StorageType {
        return type
    }
    
}
