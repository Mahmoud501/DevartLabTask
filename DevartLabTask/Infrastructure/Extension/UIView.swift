//
//  UIView+Effects.swift
//  DevartLabTask
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import Foundation
import UIKit

extension UIView
{
    func setCornerRadius(_ value: CGFloat)
    {
        DispatchQueue.main.async {
            self.layer.cornerRadius = value
            self.layer.masksToBounds = true
        }
    }
    
    func setCirleCornerRadius()
    {
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.size.height / 2
            self.layer.masksToBounds = true
        }
    }
}
