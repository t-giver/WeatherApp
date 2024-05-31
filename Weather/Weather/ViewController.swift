import UIKit

class ViewController: UIViewController {
    
    let setWeather = SetWeather()
    
    @IBOutlet weak var resultView: UIImageView!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.hidesWhenStopped = true
    }
    
    @IBAction func btnReload(_ sender: Any) {
        self.indicator.startAnimating()
        
        setWeather.fetchWeather { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self?.handleWeatherData(weather: weather)
                case .failure(let error):
                    self?.handleWeatherError(message: error.localizedDescription)
                    self?.indicator.stopAnimating()
                }
            }
        }
    }
    
    @IBAction func closebtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func handleWeatherData(weather: Weather) {
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
    
    private func handleWeatherError(message: String) {
        let alert = UIAlertController(title: message, message: "もう一度お試しください", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        self.indicator.stopAnimating()
    }
}
