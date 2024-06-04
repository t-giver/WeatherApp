//
//  TableListViewController.swift
//  Weather
//
//  Created by spark-05 on 2024/06/03.
//

import UIKit



class TableListViewController: UIViewController,UITableViewDataSource {
    let sendList = SendList()
    var weatherList:[List] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        fetchWeatherData()
    }
    
    func fetchWeatherData() {
        sendList.dataList {result in
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    self.weatherList = list
                    self.tableView.reloadData()
                case .failure(let error):
                    self.handleWeatherError(message: error.localizedDescription)
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        let weatherInfo = weatherList[indexPath.row]
        let maxTemp = weatherInfo.info.maxTemp
        let minTemp =  weatherInfo.info.minTemp
        let img = weatherInfo.info.weatherCondition
        
        cell.textLabel?.text =  "\(weatherInfo.area)"
        cell.detailTextLabel?.text = "最高:\(maxTemp),最低:\(minTemp)"
        cell.imageView?.image = UIImage(named: img)?.withRenderingMode(.alwaysTemplate)
        switch img {
        case "sunny":
            cell.imageView?.tintColor = .red
        case "cloudy":
            cell.imageView?.tintColor = .gray
        case "rainy":
            cell.imageView?.tintColor = .blue
        default:
            break
        }
        return cell
    }
    
    func handleWeatherError(message: String) {
        let alert = UIAlertController(title:"通信エラー", message: "もう一度お試しください", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_) in self.viewDidLoad()}))
        self.present(alert, animated: true, completion: nil)
        //        tableView.reloadData()
        self.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let maxTemp = weatherList
        if segue.identifier == "CellSegue" {
            if let indexPath = tableView.indexPathForSelectedRow{
                print(indexPath)
//                if let vc = segue.destination as? ViewController {
//                        vc.segueMinTemperature = minText
//                        vc.segueMaxTemperature = maxTemp
//                    }
                }
            }
        }
    }

