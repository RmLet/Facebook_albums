//
//  TableViewCell.swift
//  FacebookAlbums
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import UIKit


class TableViewCell:UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    var spinner:UIActivityIndicatorView? =  UIActivityIndicatorView(style:.large)

    weak var viewModel:TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {return}
            self.name.text = viewModel.name
            let dateString = viewModel.created
            let dateFormatter = ISO8601DateFormatter()
            let date = dateFormatter.date(from:dateString)!
            let formatter2 = DateFormatter()
            formatter2.timeStyle = .medium
            self.date.text = formatter2.string(from: date)
            spinner!.translatesAutoresizingMaskIntoConstraints = false
            spinner!.startAnimating()
            self.photo.addSubview(spinner!)
            spinner?.centerXAnchor.constraint(equalTo: self.photo.centerXAnchor).isActive = true
            spinner!.centerYAnchor.constraint(equalTo: self.photo.centerYAnchor).isActive = true
            self.downloadImage(from: URL(string:viewModel.image)!)
        }
    }
    
    private func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() { [weak self] in
                self?.spinner?.removeFromSuperview()
                self?.spinner = nil
                self?.photo.image = UIImage(data: data)
            }
        }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
