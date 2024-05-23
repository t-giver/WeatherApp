//
//  ViewController.swift
//  weather
//
//  Created by spark-05 on 2024/05/22.
//

import UIKit
import YumemiWeather

class ViewController: UIViewController {
    

    @IBOutlet weak var resultView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnReload(_ sender: Any) {
        setWeatherType()
    }
    
    func setWeatherType(){
        let fetchWeatherString = YumemiWeather.fetchWeatherCondition()
        if let image = UIImage(named: fetchWeatherString)?.withRenderingMode(.alwaysTemplate) {
            resultView.image = image
            switch fetchWeatherString {
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
    
    @IBAction func closebtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

