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
        self.indicator.hidesWhenStopped = true
        
    }
    
    @IBAction func btnReload(_ sender: Any) {
        setWeather.wetherDate()
        self.indicator.startAnimating()
    }
    @IBAction func closebtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
}

extension ViewController: weatherDateSet {
    func weatherDateCollection(weather: Weather) {
        DispatchQueue.main.async{
            if let image = UIImage(named: weather.weatherCondition)?.withRenderingMode(.alwaysTemplate) {
                self.resultView.image = image
            }
            switch weather.weatherCondition {
            case "sunny":
                self.resultView.tintColor = .red
            case "cloudy":
                self.resultView.tintColor = .gray
            case "rainy":
                self.resultView.tintColor = .blue
            default:
                break
            }
            self.minTemperature.text = String(weather.minTemp)
            self.maxTemperature.text = String(weather.maxTemp)
            self.indicator.stopAnimating()
            self.indicator.isHidden = true
        }
        
    }
    func wetherError(message:String) {
        DispatchQueue.main.async{
            let alert = UIAlertController(title:message, message: "もう一度お試しください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.indicator.stopAnimating()
        }
    }
    
    
}


