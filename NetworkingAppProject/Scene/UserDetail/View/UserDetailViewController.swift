//
//  UserDetailViewController.swift
//  NetworkingAppProject
//
//  Created by Lala on 17.07.24.
//

import UIKit

class UserDetailViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
 
    var user : Users!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameLabel.text = user.name
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        companyLabel.text = user.company.name
        addressLabel.text = ("Street: \(user.address.city) \n Suite: \(user.address.suite) \n City: \(user.address.city) \n Zipcode: \(user.address.zipcode)")
    }
}
