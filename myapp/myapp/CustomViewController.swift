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


class CustomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIBarButtonItem!
    
    var drinktext: String?  //前の画面のドリンク名を受け取る
    var drinkprice: Int? //前の画面の値段を受け取る
    
    //ミルク
    var milkd = [0,0,0,0,0,0,0,0,0]
    let milk = ["無脂肪ミルク(ノンファット)","低脂肪ミルク(ツーパーセント)","ブレベミルク","オールミルク","エクストラミルク","ライトミルク","リストレット","エキストラホット(熱め)","ライトホット(ぬるめ)"]
    //パウダー・チップ
    var frad = [0,0,0,0,0,0]
    let fra = ["エキストラチップ(多め)","ライトチップ(少なめ)","ノンチップ(少なめ)","エキストラパウダー(多め)","ライトパウダー(少なめ)","ノンパウダー(なし)"]
    
    //トッピング系
    var sourced = [0,0,0,0,0,0,0,0,0]
    let source = ["エキストラソース(多め)","ライトソース(少なめ)","ノンソース(なし)","エクストラホイップ(多め)","ライトホイップ(少なめ)","ノンホイップ(なし)","エクストラトッピング(多め)","ライトトッピング(少なめ)","ノントッピング(なし)"]
    
    /*let menu = ["エクストラシロップ(多め)","ライトシロップ(少なめ)","ノンシロップ(なし)"]*/
    var addd = [0,0,0,0,0,0,0,0]
    var add = ["バニラシロップ追加","キャラメルシロップ追加","モカシロップ追加","ホワイトモカシロップ追加","ヘーゼルナッツシロップ追加","アーモンドトフィーシロップ追加","クラシックシロップ追加","チャイシロップ追加"]
    //シロップ変更
    var changed = [0,0,0,0,0,0,0,0,0,0,0]
    let change = ["エクストラシロップ(多め)","ライトシロップ(少なめ)","ノンシロップ(なし)","バニラシロップ変更","キャラメルシロップ変更","モカシロップ変更","ホワイトモカシロップ変更","ヘーゼルナッツシロップ変更","アーモンドトフィーシロップ変更","クラシックシロップ変更","チャイシロップ変更"]
    var iced = [0,0]
    let ice = ["ライトアイス(少なめ)", "ノンアイス(なし)"]
    
    let sec = ["ミルク", "パウダー・チップ","変更","追加","氷","トッピング"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // trueで複数選択、falseで単一選択
        tableView.allowsMultipleSelection = true
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        self.view.addSubview(tableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* セッションの数を返すめメソッド*/
    func numberOfSections(in tableView: UITableView) -> Int {
        return sec.count
    }
    
    /* セッションの名前を返すメソッド */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sec[section]
    }
    
    
    /*テーブルに表示する配列の総数を返す.*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return milk.count
        }
        else if section == 1{
            return fra.count
        }
        else if section == 2{
            return change.count
        }
        else if section == 3{
            return add.count
        }
        else if section == 4 {
            return ice.count
        }
        else if section == 5{
            return source.count
        }
        else{
            return 0
        }
        
    }
    
    /*Cellに値を設定する.*/
    //値の表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "CustomCell")
        
        /* とりあえずチェックマークを外す */
        cell?.accessoryType = .none
        
        /* 表示するセルに1が入っていたらチェックマークを付ける */
            
            if indexPath.section == 0 {
                /* 表示するセルのデータの配列に1が入ってたらマークをつける */
                if milkd[indexPath.row] == 1{
                    cell?.accessoryType = .checkmark
                }
                /* それ以外はそのまま表示 */
                cell.textLabel?.text = "\(milk[indexPath.row])"
                
            } else if indexPath.section == 1 {
                if frad[indexPath.row] == 1 {
                    cell?.accessoryType = .checkmark
                }
                
                cell.textLabel?.text = "\(fra[indexPath.row])"
                
            }else if indexPath.section == 2 {
                if changed[indexPath.row] == 1{
                    cell?.accessoryType = .checkmark
                }
                cell.textLabel?.text = "\(change[indexPath.row])"
                
            }
            else if indexPath.section == 3 {
                if addd[indexPath.row] == 1{
                    cell?.accessoryType = .checkmark
                }
                cell.textLabel?.text = "\(add[indexPath.row])"
                
            }
            else if indexPath.section == 4 {
                if iced[indexPath.row] == 1{
                    cell?.accessoryType = .checkmark
                }
                cell.textLabel?.text = "\(ice[indexPath.row])"
                
            }
            else if indexPath.section == 5 {
                if sourced[indexPath.row] == 1{
                    cell?.accessoryType = .checkmark
                }
                
                cell.textLabel?.text = "\(source[indexPath.row])"
                
            }
        
        return cell
    }
    
    //セルをタップしたときに呼び出し
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        /* 選択されたセクションのインデックスを代入 */
        var tapsec = indexPath.section
        /* 選択されたセルのインデックスを代入 */
        var tapcel = indexPath.row
        
        /* タップされたときにセクションのセルに1を代入する */
        if tapsec == 0
        {
            milkd[tapcel] = 1
        }
        else if tapsec == 1
        {
            frad[tapcel] = 1
        }
        else if tapsec == 2
        {
            changed[tapcel] = 1
        }
        else if tapsec == 3
        {
            addd[tapcel] = 1
        }
        else if tapsec == 4
        {
            iced[tapcel] = 1
        }
        else if tapsec == 5
        {
            sourced[tapcel] = 1
        }
        
        // チェックマークを入れる
        cell?.accessoryType = .checkmark
    }
    
    
    //セルの選択が外れたとき
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        /* 選択されたセクションのインデックスを代入 */
        var tapsec = indexPath.section
        /* 選択されたセルのインデックスを代入 */
        var tapcel = indexPath.row
        
        /* タップされたときにセクションのセルに1を代入する */
        if tapsec == 0
        {
            milkd[tapcel] = 0
        }
        else if tapsec == 1
        {
            frad[tapcel] = 0
        }
        else if tapsec == 2
        {
            changed[tapcel] = 0
        }
        else if tapsec == 3
        {
            addd[tapcel] = 0
        }
        else if tapsec == 4
        {
            iced[tapcel] = 0
        }
        else if tapsec == 5
        {
            sourced[tapcel] = 0
        }
        
        // チェックマークを外す
        cell?.accessoryType = .none
    }
    
    
    /* 画面遷移が行われるときに呼び出される */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        let controller = segue.destination as! copyViewController
        
        /* 前の画面でチェックマークがついた文字列を代入していく */
        var text = String()
        
        /* 一番初めにドリンクの名前を挿入 */
        text.append(drinktext!)
        /* ドリンクの値段を挿入 */
        text.append(" ¥" + String(drinkprice!))
        text.append("\n")//改行
        text.append("\n")//改行
        
        /* milkがチェックマーク */
        
        for count in 0...8
        {
            if milkd[count] == 1
            {   text.append("#")
                text += milk[count]
                text.append("\n")//改行
            }
            
        }
        for count in 0...5
        {
            if frad[count] == 1
            {   text.append("#")
                text += fra[count]
                text.append("\n")//改行
            }
        }
        for count in 0...8
        {
            if sourced[count] == 1
            {   text.append("#")
                text += source[count]
                text.append("\n")//改行
            }
        }
        for count in 0...7
        {
            if addd[count] == 1
            {   text.append("#")
                text += add[count]
                text.append("\n")//改行
            }
        }
        for count in 0...10
        {
            if changed[count] == 1
            {   text.append("#")
                text += change[count]
                text.append("\n")//改行
            }
        }
        for count in 0...1
        {
            if iced[count] == 1
            {
                text.append("#")
                text += ice[count]
                text.append("\n")
            }
        }
        
        controller.copytext1 = text//チェックマークの付いたカスタムを送る
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

