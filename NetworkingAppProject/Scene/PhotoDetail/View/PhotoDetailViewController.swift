//
//  PhotoDetailViewController.swift
//  NetworkingAppProject
//
//  Created by Lala on 17.07.24.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo : Photos!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
//        photoImageView.image = photo.thumbnailUrl

        let url = URL(string: photo.thumbnailUrl!)

        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, error == nil {
                    DispatchQueue.main.async {
                        self.photoImageView.image = UIImage(data: data)
                    }
                } else {
                    print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
            task.resume()
        }
    }
}



