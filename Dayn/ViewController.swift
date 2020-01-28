//
//  ViewController.swift
//  Dayn
//
//  Created by Antique on 28/1/20.
//  Copyright © 2020 Antique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dayn = DaynView()
        dayn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dayn)
        
        dayn.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dayn.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dayn.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

