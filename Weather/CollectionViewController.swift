//
//  CollectionViewController.swift
//  Weather
//
//  Created by spark-05 on 2024/06/06.
//

import UIKit
class CollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let sendList = SendList()
    var weatherList:[List] = []
    let collectionCell = CollectionViewCell()
    
    
                                                    
    @IBOutlet weak var collectionList: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionList.dataSource = self
        collectionList.delegate = self
        fetchWeatherData()
    }

    func fetchWeatherData() {
        sendList.dataList {result in
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    self.weatherList = list
                    self.collectionList.reloadData()
                case .failure(let error):
                    self.handleWeatherError(message: error.localizedDescription)
                }
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
            
            let weatherimg = weatherList[indexPath.row]
            let imgeList = weatherimg.info.weatherCondition
            
        cell.imaegeSell.image = UIImage(named: imgeList)?.withRenderingMode(.alwaysTemplate)
            switch imgeList {
            case "sunny":
                cell.sellImage.tintColor = .red
            case "cloudy":
                cell.sellImage.tintColor = .gray
            case "rainy":
                cell.sellImage.tintColor = .blue
            default:
                break
            }
            return cell
            
        }
    
    func handleWeatherError(message: String) {
        let alert = UIAlertController(title:"通信エラー", message: "もう一度お試しください", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            self?.fetchWeatherData()}))
        self.present(alert, animated: true, completion: nil)
        //        tableView.reloadData()
        self.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCell",
           let indexPath = collectionList.indexPathsForSelectedItems?.first,
           let send = segue.destination as? ViewController {
            send.text = weatherList[indexPath.row]
        }
    }
    
    }

