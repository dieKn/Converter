//
//  ViewController.swift
//  Converter
//
//  Created by 加藤大 on 2019/08/24.
//  Copyright © 2019 加藤大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var inputField: UILabel!
    @IBOutlet weak var outputField: UILabel!
    @IBOutlet weak var inputUIPicker: UIPickerView!
    @IBOutlet weak var outputUIPicker: UIPickerView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var label = UILabel()
    var strValue :String = ""
    let intValue :Int = 0
    private let reuseIdentifier = "CollectionViewCell"
    
    let keyBoard: [String] = [
        "1","2", "3",
        "4", "5", "6",
        "7", "8", "9",
        "0", "C"
    ]
    let texts:[[String]] = [["","キロ","ミリ","ミクロ","マイクロ","メガ", "ギガ", "テラ"],["M", "Byte", "Sec"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // DelegateとDataSourceの紐付け
        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        inputUIPicker.delegate = self
        inputUIPicker.dataSource = self
        outputUIPicker.delegate = self
        outputUIPicker.dataSource = self
        
    }
    
    // 入出力メソッド
    @IBAction func buttonTouchDown(_ sender: UIButton) {
        if(sender.accessibilityValue == "C"){
            strValue = ""
            inputField.text = ""
            outputField.text = ""
            return
        }
        strValue = strValue + sender.accessibilityValue!
        inputField.text = strValue
        outputField.text = calculate(input: Int(strValue)!)
    }
    
    //計算メソッド
    func calculate( input:Int) -> String{
        let output: Double
        let strOutput: String;
        if(self.texts[0][self.inputUIPicker.selectedRow(inComponent: 0)] == "キロ" && self.texts[0][self.outputUIPicker.selectedRow(inComponent: 0)] == ""){
            output = Double(input) * 1000
            return output.description
        }else if(self.texts[0][self.inputUIPicker.selectedRow(inComponent: 0)] == "ミリ" && self.texts[0][self.outputUIPicker.selectedRow(inComponent: 0)] == ""){
            output = Double(input) / 1000
            return output.description
        }else if(self.texts[0][self.inputUIPicker.selectedRow(inComponent: 0)] == "ミクロ" && self.texts[0][self.outputUIPicker.selectedRow(inComponent: 0)] == ""){
            output = Double(input) / 1000000
            return output.description
        }else if(self.texts[0][self.inputUIPicker.selectedRow(inComponent: 0)] == "マイクロ" && self.texts[0][self.outputUIPicker.selectedRow(inComponent: 0)] == ""){
            output = Double(input) / 1000000000
            return output.description
        }else if(self.texts[0][self.inputUIPicker.selectedRow(inComponent: 0)] == "メガ" && self.texts[0][self.outputUIPicker.selectedRow(inComponent: 0)] == ""){
            output = Double(input) * 1000000
            return output.description
        }else if(self.texts[0][self.inputUIPicker.selectedRow(inComponent: 0)] == "ギガ" && self.texts[0][self.outputUIPicker.selectedRow(inComponent: 0)] == ""){
            output = Double(input) * 1000000000
            return output.description
        }else if(self.texts[0][self.inputUIPicker.selectedRow(inComponent: 0)] == "テラ" && self.texts[0][self.outputUIPicker.selectedRow(inComponent: 0)] == ""){
            let output = input * 1000000000000
            return output.description
        }
        output = Double(input) * 2
        strOutput = output.description
        return strOutput
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
        
        // cellの登録
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
       // buttonの装飾
        cell.button.setTitle(keyBoard[indexPath.item], for: .normal)
        cell.button.accessibilityValue=keyBoard[indexPath.item]
        cell.button.setTitleColor(UIColor.white, for: .normal)
        
        cell.button.titleLabel?.font = UIFont(name: "Helvetica-Bold",size: CGFloat(30));
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UIPickerViewDelegate{
    //pickerに表示する値を返すデリゲートメソッド.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return texts[component][row]
    }
    
    
    // pickerが選択された際に呼ばれるデリゲートメソッド.
    // TODO: pickerの装飾を変えられない
    private func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) -> UIView {
        label.text = texts[component][row]
        label.textColor = UIColor.blue
        label.font = label.font.withSize(4)
        return label
    }
}

extension ViewController: UIPickerViewDataSource{
    // pickerの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return texts.count
    }
    
    // pickerに表示する値の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return texts[component].count
    }
}
