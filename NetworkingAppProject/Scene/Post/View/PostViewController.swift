//
//  PostViewController.swift
//  NetworkingAppProject
//
//  Created by Lala on 13.07.24.
//

import UIKit

class PostViewController: UIViewController {
        
    @IBOutlet weak var table: UITableView!

    var viewModel = PostViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getPostItems {
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        cell.titleLabel.text = viewModel.items[indexPath.row].title
        cell.bodyLabel.text = viewModel.items[indexPath.row].body
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "CommentViewController") as! CommentViewController
        vc.viewModel.postId = viewModel.items[indexPath.row].id ?? 0
        navigationController?.show(vc, sender: nil)
    }
    
}
