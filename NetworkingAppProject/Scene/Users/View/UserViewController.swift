//
//  UserViewController.swift
//  NetworkingAppProject
//
//  Created by Lala on 13.07.24.
//

import UIKit
import Alamofire

class UserViewController: UIViewController {

    @IBOutlet weak var userTable: UITableView!

    var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getPostItems {
            self.userTable.reloadData()
        }
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = viewModel.users[indexPath.row].name
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        vc.user = viewModel.users[indexPath.row]
        navigationController?.show(vc, sender: nil)
    }
}
