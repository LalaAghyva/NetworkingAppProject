//
//  AlbumsViewController.swift
//  NetworkingAppProject
//
//  Created by Lala on 13.07.24.
//

import UIKit

class AlbumsViewController: UIViewController {

    @IBOutlet weak var albumsTable: UITableView!
    
    var viewModel = AlbumsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getPostItem {
            DispatchQueue.main.async {
                self.albumsTable.reloadData()
            }
        }
    }
    


}

extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = viewModel.albums[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

