//
//  CollectionViewCell.swift
//  Converter
//
//  Created by 加藤大 on 2019/09/01.
//  Copyright © 2019 加藤大. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // cellの枠の太さ
        self.layer.borderWidth = 0
        // cellを丸くする
        self.layer.cornerRadius = 40
        // 背景色をつける
        self.layer.backgroundColor = UIColor.orange.cgColor
    }
    
}
