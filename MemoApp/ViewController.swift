//
//  ViewController.swift
//  Kadai1-2mohann
//
//  Created by 大江祥太郎 on 2018/10/27.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = resultArray[indexPath.row]
        return cell
    }
   
    var resultArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "hoge") != nil{
            resultArray = UserDefaults.standard.object(forKey:"hoge") as![String]
        }
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //resultArray,indexPathのrow番目を消す
            resultArray.remove(at: indexPath.row)
            //再び配列に保存
            UserDefaults.standard.set(resultArray, forKey: "hoge")
            //更新
           tableView.reloadData()
        }
    }
    
    

}

