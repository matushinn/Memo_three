//
//  AddViewController.swift
//  Kadai1-2mohann
//
//  Created by 大江祥太郎 on 2018/10/27.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    //入力されたリストを格納する場所
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        
    }
    

    
    @IBAction func addButton(_ sender: Any) {
        //現在の配列の状況を取り出す
        if UserDefaults.standard.object(forKey: "hoge") != nil{
            array = UserDefaults.standard.object(forKey: "hoge") as![String]
        }
        
        //textFieldで記入されたテキストを入れる
        array.append(textField.text!)
        
        //キー値”hoge”で配列で保存
        UserDefaults.standard.set(array, forKey: "hoge")
        //画面遷移
        self.navigationController?.popViewController(animated: true)
        
        print(array)
    }
}
