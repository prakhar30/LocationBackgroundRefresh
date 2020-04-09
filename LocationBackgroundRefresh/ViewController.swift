//
//  ViewController.swift
//  LocationBackgroundRefresh
//
//  Created by Prakhar Tripathi on 09/04/20.
//  Copyright © 2020 Prakhar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("view loaded")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = UIColor.green
    }
}
