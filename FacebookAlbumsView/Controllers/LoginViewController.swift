//
//  LoginViewController.swift
//  FacebookAlbums
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        let loginButton = FBLoginButton()
        loginButton.permissions =  ["public_profile", "email", "user_friends","user_photos"]
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        let image = UIImage(systemName: "plus.circle.fill")
        let button_item = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(go_to_))
        button_item.tintColor = .black
        
        navigationItem.rightBarButtonItem = button_item
        navigationItem.title = "Facebook Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NotificationCenter.default.addObserver(forName: .AccessTokenDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            self.go_to_()
        }
        
        
        if let token = AccessToken.current, !token.isExpired {
            self.go_to_()
        }
    }
    
    
    @objc private func go_to_() {
        guard let _ = AccessToken.current else {return}
        FacebookAlbumsRequest.return_data(callback: { [weak self] data in
            guard let data = data else {return}
            self?.performSegue(withIdentifier: "TableViewController", sender: data)
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == "TableViewController" {
            if let tableViewContoller = segue.destination as? TableViewController {
                if let model = sender as? FacebookResponse {
                    tableViewContoller.viewModel = TableViewModel(model: model)
                }
            }
        }
    }
}
