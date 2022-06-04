//
//  UserModel.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation

/*
 UserModel is model created for one purpose is that connect model of repo direct with ui so
 you can't use model of local repo or network repo because it can be changed while project scaling.
 */

class UserModel {
    
    var id: Int?
    var name: String?
    var salary: Double?
    
    init() {}
    
}
