//
//  ViewController.swift
//  myapp
//
//  Created by 山崎滉貴 on 2019/01/22.
//  Copyright © 2019年 Kouki Yamazaki. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let coffee = ["ドリップ コーヒー","カフェ ミスト","コールドブリューコーヒー"]
    let price1 = [280,320,320]
    
    let espresso = ["スターバックス ラテ", "ソイ ラテ","カプチーノ", "カフェ モカ", "ホワイトモカ", "キャラメルマキアート", "カフェアメリカーノ","ムースフォームラテ"]
    let price2 = [330,380,330,400,400,380,300,440]
    
    let Frappuccino = ["コーヒーフラペチーノ","キャラメルフラペチーノ", "ダークモカチップフラペチーノ", "バニラクリームフラペチーノ", "抹茶クリームフラペチーノ", "マンゴーパッションティーフラペチーノ"]
    let price3 = [420,470,490,470,470,450]
    
    let tea = ["抹茶ティーラテ", "チャイティーラテ", "イングリッシュブレックファストティーラテ", "アールグレイティーラテ", "ほうじ茶ティーラテ", "カモミールティーラテ"]
    let price4 = [390,380,380,380,380,380]
    
    let hottea = ["アイスティー(ブラック)", "アイスティー(パッション)", "イングリッシュブレックファスト", "アールグレイ","ほうじ茶","カモミール","ミントシトラス", "ユースベリー","ハイビスカス"]
    let price5 = [290,290,340,340,340,340,340,340,340]
    
    let others = ["ココア", "キャラメルスチーマー"]
    let price6 = [370,360]
    
    //ドリンクをセッションごとに分ける
    let drink = ["コーヒー","エスプレッソドリンク", "フラペチーノ", "ティーラテ", "ストレートティー", "その他ドリンク"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UITableViewDataSourceプロトコルの準拠のため
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /* セッションの数を返すめメソッド*/
    func numberOfSections(in tableView: UITableView) -> Int {
        return drink.count
    }
    
    /* セッションの名前を返すメソッド */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return drink[section]
    }

    /*Cellが選択された際に呼び出される.*/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //コーヒー
        if indexPath.section == 0 {
            
            print("Value: \(coffee[indexPath.row])")
            
        }
        //エスプレッソドリンク
        else if indexPath.section == 1 {
            
            print("Value: \(espresso[indexPath.row])")
            
        }
        //フラペチーノ
        else if indexPath.section == 2{
            print ("Value: \(Frappuccino[indexPath.row])")
        }
        
        //ティーラテ
        else if indexPath.section == 3{
            print ("Value: \(tea[indexPath.row])")
        }
        //ストレートティー
        else if indexPath.section == 4{
            print ("Value: \(hottea[indexPath.row])")
        }
        else if indexPath.section == 5{
            print ("Value: \(others[indexPath.row])")
        }
        
    }
    /*テーブルに表示する配列の総数を返す.*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return coffee.count
            
        } else if section == 1 {
            
            return espresso.count
            
        }
        else if section == 2 {
            
            return Frappuccino.count
            
        }
        else if section == 3{
            return tea.count
        }
        else if section == 4 {
            
            return hottea.count
            
        }
        else if section == 5{
            return others.count
        }
        else {
            
            return 0
            
        }
        
    }
    
    /*Cellに値を設定する.*/
    //値の表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        
        if indexPath.section == 0 {
            
            cell.textLabel?.text = "\(coffee[indexPath.row])"
            
        } else if indexPath.section == 1 {
            
            cell.textLabel?.text = "\(espresso[indexPath.row])"
            
        }else if indexPath.section == 2 {
            
            cell.textLabel?.text = "\(Frappuccino[indexPath.row])"
            
        }
        else if indexPath.section == 3 {
            
            cell.textLabel?.text = "\(tea[indexPath.row])"
            
        }
        else if indexPath.section == 4 {
            
            cell.textLabel?.text = "\(hottea[indexPath.row])"
            
        }
        else if indexPath.section == 5 {
            
            cell.textLabel?.text = "\(others[indexPath.row])"
            
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /* selectedRowにはどのセクションどのセルがタップされたかが入っている */
        if let selectedRow = tableView.indexPathForSelectedRow{
        
            let controller = segue.destination as! CustomViewController
            
            /* どのセクションのどのセルを次の画面に渡すか */
            if selectedRow.section == 0 {
                
               controller.drinktext = coffee[selectedRow.row]
                controller.drinkprice = price1[selectedRow.row]
            }
            else if selectedRow.section == 1 {
                
                controller.drinktext = espresso[selectedRow.row]
                controller.drinkprice = price2[selectedRow.row]
            }
            else if selectedRow.section == 2 {
                
                controller.drinktext = Frappuccino[selectedRow.row]
                controller.drinkprice = price3[selectedRow.row]
            }
            else if selectedRow.section == 3 {
                
                controller.drinktext = tea[selectedRow.row]
                controller.drinkprice = price4[selectedRow.row]
            }
            else if selectedRow.section == 4 {
                
                controller.drinktext = hottea[selectedRow.row]
                controller.drinkprice = price5[selectedRow.row]
            }
            else if selectedRow.section == 5 {
                
                controller.drinktext = others[selectedRow.row]
                controller.drinkprice = price6[selectedRow.row]
            }
        }
        
    }

    
    
    


}

