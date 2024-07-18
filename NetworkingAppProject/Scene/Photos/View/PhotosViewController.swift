//
//  PhotosViewController.swift
//  NetworkingAppProject
//
//  Created by Lala on 13.07.24.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet weak var photosTable: UITableView!
    
    var viewModel = PhotosViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getPostItemsWithRequest {
            DispatchQueue.main.async {
                self.photosTable.reloadData()
            }
        }
    }
    

}

extension PhotosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell") as! PhotosCell
        let photo = viewModel.photos[indexPath.row]
        
        cell.photosLabel.text = photo.title
        
        // Asynchronous image loading
        if let urlString = photo.thumbnailUrl, let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, error == nil {
                    DispatchQueue.main.async {
                        // Ensure the cell is still visible
                        if let visibleCell = tableView.cellForRow(at: indexPath) as? PhotosCell {
                            visibleCell.photosImageView.image = UIImage(data: data)
                        }
                    }
                }
            }.resume()
        } else {
            cell.photosImageView.image = nil // Or set a placeholder image
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "PhotoDetailViewController") as! PhotoDetailViewController
        vc.photo = viewModel.photos[indexPath.row]
        navigationController?.show(vc, sender: nil)
    }
}
