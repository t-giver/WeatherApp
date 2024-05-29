//
//  ViewController.swift
//  weather
//
//  Created by spark-05 on 2024/05/22.
//

import UIKit


class ViewController: UIViewController {
    
    let setWeather = SetWeather()
    var delegate: weatherDateSet?
    
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
    @IBOutlet weak var minTemperature: UILabel!
    
    @IBOutlet weak var maxTemperature: UILabel!
}



extension ViewController: weatherDateSet {
    
    func weatherDateCollection(weather: Weather) {
        if let image = UIImage(named: weather.weatherCondition)?.withRenderingMode(.alwaysTemplate) {
            resultView.image = image
        }
        switch weather.weatherCondition {
        case "sunny":
            resultView.tintColor = .red
        case "cloudy":
            resultView.tintColor = .gray
        case "rainy":
            resultView.tintColor = .blue
        default:
            break
        }
        minTemperature.text = String(weather.minTemp)
        maxTemperature.text = String(weather.maxTemp)
    }
    
    func wetherError(message:String) {
        let alert = UIAlertController(title:message, message: "もう一度お試しください", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}

