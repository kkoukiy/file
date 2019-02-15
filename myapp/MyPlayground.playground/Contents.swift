//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//
//  CustomViewController.swift
//  myapp
//
//  Created by 山崎滉貴 on 2019/01/22.
//  Copyright © 2019年 Kouki Yamazaki. All rights reserved.
//

import UIKit


var test = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
//var add:[IndexPath] = []

class CustomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    //let text=""
    
    let milk = ["無脂肪ミルク(ノンファット)","低脂肪ミルク(ツーパーセント)","ブレベミルク","オールミルク","エクストラミルク","ライトミルク","リストレット","エキストラホット(熱め)","ライトホット(ぬるめ)"]
    
    let cream = ["エクストラホイップ(多め)","ライトホイップ(少なめ)","ノンホイップ(なし)"]
    
    let source = ["エキストラソース(多め)","ライトソース(少なめ)","ノンソース(なし)"]
    //全部入ってる
    let menu = ["無脂肪ミルク(ノンファット)","低脂肪ミルク(ツーパーセント)","ブレベミルク","オールミルク","エクストラミルク","ライトミルク","リストレット","エキストラホット(熱め)","ライトホット(ぬるめ)","エキストラチップ(多め)","ライトチップ(少なめ)","ノンチップ(少なめ)","エキストラパウダー(多め)","ライトパウダー(少なめ)","ノンパウダー(なし)",
                "エクストラシロップ(多め)","ライトシロップ(少なめ)","ノンシロップ(なし)"]
    var add = ["バニラシロップ追加","キャラメルシロップ追加","モカシロップ追加","ホワイトモカシロップ追加","ヘーゼルナッツシロップ追加","アーモンドトフィーシロップ追加","クラシックシロップ追加","チャイシロップ追加"]
    
    let change = ["バニラシロップ変更","キャラメルシロップ変更","モカシロップ変更","ホワイトモカシロップ変更","ヘーゼルナッツシロップ変更","アーモンドトフィーシロップ変更","クラシックシロップ変更","チャイシロップ変更"]
    
    let ice = ["ライトアイス(少なめ)", "ノンアイス(なし)"]
    
    //let sum: [String] = []
    
    //var sum:String = milk.joined()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    
        // tableView.register(UITableViewCell.self, forCellReuseIdentifier: //"cell")
        // trueで複数選択、falseで単一選択
        tableView.allowsMultipleSelection = true
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        self.view.addSubview(tableView)
        
        //navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*editボタンのメソッド
     override func setEditing(_ editing: Bool, animated: Bool) {
     super.setEditing(editing, animated: animated)
     tableView.isEditing = editing
     }
     */
    
    
    /*テーブルに表示する配列の総数を返す.*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menu.count
        
    }
    
    /*Cellに値を設定する.*/
    //値の表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "CustomCell")
        cell?.accessoryType = .none
        cell.textLabel?.text = menu[indexPath.row]
        
        return cell
    }
    
    //セルをタップしたときに呼び出し
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        var select = indexPath.row
        
        test[select] = 1
        //元々書いてある処理
        //let menus = menu[indexPath.row]
        // チェックマークを入れる
        cell?.accessoryType = .checkmark
    }
    
    func prepareForReuse() {
        
    }
    
    //セルの選択が外れたとき
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        // チェックマークを外す
        cell?.accessoryType = .none
    }
    
    
    
}




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

