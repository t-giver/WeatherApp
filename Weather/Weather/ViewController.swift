//
//  ViewController.swift
//  weather
//
//  Created by spark-05 on 2024/05/22.
//

import UIKit


class ViewController: UIViewController {
    
    let setWeather = SetWeather()
    var delegate:weatherDateSet?
    
    @IBOutlet weak var resultView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setWeather.delegate = self
    }
    
    
    
    @IBAction func btnReload(_ sender: Any) {
        setWeather.wetherDate()
    }
    
    
    
    @IBAction func closebtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: weatherDateSet {
    func wetherDate(type: String){
        if let image = UIImage(named:type)?.withRenderingMode(.alwaysTemplate) {
            resultView.image = image
        }
        
        switch type {
        case "sunny":
            resultView.tintColor = .red
        case "cloudy":
            resultView.tintColor = .gray
        case "rainy":
            resultView.tintColor = .blue
        default:
            resultView.tintColor = .black
        }
    }
}





