//
//  ViewController.swift
//  Converter
//
//  Created by 加藤大 on 2019/08/24.
//  Copyright © 2019 加藤大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "CollectionViewCell"
    
    let keyBoard: [String] = [
        "1","2", "3",
        "4", "5", "6",
        "7", "8", "9", "0"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // DelegateとDataSourceの紐付け
        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // スタンプが押された時の処理を書く
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.keyBoard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.name.setTitle(keyBoard[indexPath.item], for: .normal)
        return cell
    }
}

