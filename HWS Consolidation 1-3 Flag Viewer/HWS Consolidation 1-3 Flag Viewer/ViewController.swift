//
//  ViewController.swift
//  HWS Consolidation 1-3 Flag Viewer
//
//  Created by Jared Conover on 2021-09-08.
//  In this consolidation project a table view of World flags with their names. Clicking through to the detail view displays the flag full size along with its name in the header. An action button in the detail view enables the user to share the flag image along with country name.
//

import UIKit

class ViewController: UITableViewController {
    
    var flagList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flag Viewer"
        
//        let fm = FileManager.default
        let bundleItems = try! FileManager.default.contentsOfDirectory(atPath: Bundle.main.resourcePath! )
        for item in bundleItems {
            if item.hasSuffix("2x.png") {
                flagList.append(item)
            }
        }
        
        print(bundleItems)
        print(flagList)
        
    }


}

