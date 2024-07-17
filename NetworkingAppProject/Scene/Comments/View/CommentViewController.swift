//
//  CommentViewController.swift
//  NetworkingAppProject
//
//  Created by Lala on 14.07.24.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var viewModel = CommentViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getCommentItems {
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    

}

extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.commentItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
        cell.name.text = viewModel.commentItems[indexPath.row].name
        cell.email.text = viewModel.commentItems[indexPath.row].email
        cell.body.text = viewModel.commentItems[indexPath.row].body
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
