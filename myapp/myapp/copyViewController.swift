//
//  copyViewController.swift
//  myapp
//
//  Created by 山崎滉貴 on 2019/01/25.
//  Copyright © 2019年 Kouki Yamazaki. All rights reserved.
//

import UIKit

class copyViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    

    var copytext1: String?//チェックマークの付いた文字列を受け取る
    var copyprice: Int?//ドリンクの値段
    
    
    var receive:String?//前の画面から文字を受け取る変数
    /* 長押しをしたときにLabelをコピーする */
    @IBAction func longPress(_ sender: Any) {
        guard let gesture = sender as? UIGestureRecognizer else { return }
        guard gesture.state == .ended else { return }
        guard let label = gesture.view as? UILabel else { return }
        UIPasteboard.general.string = label.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = copytext1
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
