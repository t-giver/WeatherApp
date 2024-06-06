//
//  WeatherCollectionViewCell.swift
//  Weather
//
//  Created by spark-05 on 2024/06/06.
//
import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    // ここにカスタムセルのプロパティやメソッドを追加します。
    
    @IBOutlet weak var imageView: UIImageView!
    
    // 外部から呼び出してセルを設定するメソッド
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
