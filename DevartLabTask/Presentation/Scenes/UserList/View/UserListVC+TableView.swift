//
//  UserListVC+TableView.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation
import UIKit

extension UserListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let item = self.presenter?.users?[indexPath.row]
        cell.item = item
        cell.didClickedEdit = { [weak self] in
            guard let self = self else { return }
            self.showUserPopup(user: item) { [weak self] name, salary in
                guard let self = self else { return }
                if self.presenter?.validationUser(name: name, salary: salary) == true {
                    var request = UserRepoInOut.Update.Request()
                    request.id = item?.id
                    request.name = name
                    request.salary = salary
                    self.presenter?.update(request: request)
                }else {
                    self.showPopupError(msg: "Data not valid")
                }
            }
        }
        cell.didClickedDelete = { [weak self] in
            guard let self = self else { return }
            var request = UserRepoInOut.Delete.Request()
            request.id = item?.id
            self.presenter?.deleteUser(request: request)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.TVUsers.deselectRow(at: indexPath, animated: true)
    }
}
