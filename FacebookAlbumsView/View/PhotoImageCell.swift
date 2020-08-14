//
//  PhotoImageCell.swift
//  FacebookAlbumsView
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import UIKit


class PhotoItemCell: UICollectionViewCell {
    
    var img = UIImageView()
    var spinner:UIActivityIndicatorView? =  UIActivityIndicatorView(style:.large)


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        img.contentMode = .scaleAspectFill
        img.clipsToBounds=true
        self.addSubview(img)
    }
    
    
    weak var viewModel:ImageViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {return}
            spinner!.translatesAutoresizingMaskIntoConstraints = false
            spinner!.startAnimating()
            self.img.addSubview(spinner!)
            spinner?.centerXAnchor.constraint(equalTo: self.img.centerXAnchor).isActive = true
            spinner!.centerYAnchor.constraint(equalTo: self.img.centerYAnchor).isActive = true
            self.downloadImage(from: URL(string:viewModel.image)!)
        }
    }
    
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() { [weak self] in
                self?.spinner?.removeFromSuperview()
                self?.spinner = nil
                self?.img.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        img.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
