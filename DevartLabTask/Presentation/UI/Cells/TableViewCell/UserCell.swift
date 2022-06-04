//
//  UserCell.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import UIKit

class UserCell: UITableViewCell {

    //------------------ variables ------------------
    var didClickedEdit: (()->())?
    var didClickedDelete: (()->())?
    
    //------------------ Outlets ------------------
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    //------------------ Actions ------------------
    @IBAction func editClicked(_ sender: Any) {
        didClickedEdit?()
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        didClickedDelete?()
    }
    
    //------------------ lifeCycle ------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        btnEdit.setCornerRadius(8)
        btnDelete.setCornerRadius(8)
    }
    
    //------------------ model ------------------
    var item: UserModel? {
        didSet {
            self.lblID.text = "#" + (item?.id?.description ?? "")
            self.lblName.text = item?.name
            self.lblSalary.text = (item?.salary?.description ?? "0") + " EG"
        }
    }
    
    
}
