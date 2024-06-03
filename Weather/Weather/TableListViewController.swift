//
//  TableListViewController.swift
//  Weather
//
//  Created by spark-05 on 2024/06/03.
//

import UIKit



class TableListViewController: UIViewController,UITableViewDataSource {
    let sendList = SendList()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        foge()
    }
    
    func foge(){
        sendList.dataList { result in
            DispatchQueue.main.async {
                print()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "TEST"
        return cell
    }
    
    
    
}
