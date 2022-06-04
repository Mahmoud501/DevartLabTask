//
//  UserListVC+Presenter.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation
import UIKit

extension UserListVC: UserListView {
    
    func didGetAllUser() {
        self.lblError.isHidden = true
        self.TVUsers.reloadData()
        self.activity.stopAnimating()
    }
    
    func EmptyUsers() {
        self.lblError.isHidden = false
        self.lblError.text = "users is empty"
    }
    
    func didInsertUser(user: UserModel?) {
        self.lblError.isHidden = true
        self.TVUsers.reloadData()
        self.activity.stopAnimating()
    }
    
    func didUpdateUser(user: UserModel?) {
        self.lblError.isHidden = true
        self.TVUsers.reloadData()
        self.activity.stopAnimating()
    }
    
    func didDeleteUser(user: UserModel?) {
        self.lblError.isHidden = true
        self.TVUsers.reloadData()
        self.activity.stopAnimating()
    }
    
    func showError(err: String?) {
        self.lblError.isHidden = false
        self.lblError.text = err
        self.activity.stopAnimating()
    }
    
    
}
