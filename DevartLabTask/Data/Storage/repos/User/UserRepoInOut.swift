//
//  UserRepoInOut.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation

struct UserRepoInOut {
    
    struct Insert {
        struct Request {
            var id: Int?
            var name: String?
            var salary: Double?
        }
        
        struct Response {
            var user: UserModel?
            var message: String?
            var error: RError?
        }

    }
    
    struct Update {
        struct Request {
            var id: Int?
            var name: String?
            var salary: Double?
        }
        
        struct Response {
            var user: UserModel?
            var message: String?
            var error: RError?
        }

    }
    
    struct Delete {
        struct Request {
            var id: Int?
        }
        
        struct Response {
            var user: UserModel?
            var message: String?
            var error: RError?
        }

    }
    
    struct GetAll {
        struct Request {
            
        }
        
        struct Response {
            var users: [UserModel]?
            var message: String?
            var error: RError?
        }

    }
    
}
