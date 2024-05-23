//
//  LunchViewController.swift
//  Weather
//
//  Created by spark-05 on 2024/05/23.
//

import UIKit

class LunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performSegue(withIdentifier: "toTargetViewController", sender: nil)
    }
}
