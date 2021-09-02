//
//  DetailViewController.swift
//  HWS Storm Viewer
//
//  Created by Jared Conover on 2021-08-06.
//  Copyright © 2021 Jared Conover. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // Whenever Objective-c code needs to call a swift method, the @objc annotation is required. This applies to any scenario where an Apple UI component is calling swift
    @objc func shareTapped() {
        guard let image = imageView?.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: [])
        
        // The line below will anchor the popover to the right button item on iPad, on iPhone there is no effect
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(activityViewController, animated: true)
    }

}
