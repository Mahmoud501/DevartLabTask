//
//  UserListVC.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import UIKit

//VC variables , outlets , actions
class UserListVC: UIViewController {

    //------------------ variables ------------------
    
    var presenter: UserPresenter?

    //------------------ Outlets ------------------
    
    @IBOutlet weak var TVUsers: UITableView!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    //------------------ Actions ------------------
    
    @IBAction func addUserClicked(_ sender: Any) {
        self.showUserPopup(user: nil) { [weak self] name, salary in
            guard let self = self else { return }
            if self.presenter?.validationUser(name: name, salary: salary) == true {
                var request = UserRepoInOut.Insert.Request()
                request.id = (self.presenter?.users?.last?.id ?? 0) + 1
                request.name = name
                request.salary = salary
                self.presenter?.insertUser(request: request)
            }else {
                self.showPopupError(msg: "Data not valid")
            }
        }
    }
    
}


//VC LifeCycle
extension UserListVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        setupUI()
        initFunc()
    }
    
}

//VC SetupUI
extension UserListVC {
    
    func setupPresenter() {
        if presenter == nil {
            presenter = UserPresenter.init(storage: AppStorage.init(type: .demo), userView: self)
        }
    }
    
    func setupUI() {
        TVUsers.register(UINib.init(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    func initFunc() {
        self.lblError.isHidden = true
        self.activity.startAnimating()
        self.presenter?.getAllUser()
    }
    
    func showUserPopup(user: UserModel? = nil, didClickedOk: @escaping ((String?, Double?)->())) {
        let alertVC = UIAlertController.init(title: "User", message: "set data", preferredStyle: .alert)
        alertVC.addTextField(configurationHandler: nil)
        alertVC.addTextField(configurationHandler: nil)
        alertVC.textFields?[0].text = user?.name
        alertVC.textFields?[0].placeholder = "Enter Name"
        alertVC.textFields?[1].text = user?.salary?.description
        alertVC.textFields?[1].keyboardType = .numberPad
        alertVC.textFields?[1].placeholder = "Enter Salary"
        alertVC.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { action in
            didClickedOk(alertVC.textFields?[0].text, Double(alertVC.textFields?[1].text ?? ""))
        }))
        alertVC.addAction(UIAlertAction.init(title: "Cancel", style: .destructive, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showPopupError(msg: String) {
        let alertVC = UIAlertController.init(title: "Error", message: msg, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
}
