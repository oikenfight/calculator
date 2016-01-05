//
//  ViewController.swift
//  Chapter5
//
//  Copyright © 2015年 shoeisha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //数字が入力中かどうか判断するフラグ
    var usrInputting: Bool = false
    
    // 被演算子
    var selectedOperand: String = ""
    
    // 演算対象の数字
    var targetNum: Double? = nil
    
    var resultValue: Double {
        get {
            return NSNumberFormatter().numberFromString(displayLabel.text!)!.doubleValue
        }
        set {
            displayLabel.text = "\(newValue)"
            usrInputting = false
        }
    }
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 数字ボタンを押した時に呼ばれる
    @IBAction func inputNumber(sender: UIButton) {
        var displayNum: String = "0"
        
        if !usrInputting {
            usrInputting = true
            displayNum = (sender.titleLabel?.text)!
        } else {
            displayNum = displayLabel.text!
            
            // 入力された文字を末尾に結合することで繰り上げを行う
            displayNum += (sender.titleLabel?.text)!
        }
        
        displayLabel.text = displayNum
    }
    
    // 四則演算ボタンを押した時に呼ばれる
    @IBAction func operate(sender: UIButton) {
        if usrInputting{
            enter()
        }
        
        selectedOperand = (sender.titleLabel?.text)!
    }

    
    @IBAction func enter() {
        usrInputting = false
        
        if targetNum != nil && selectedOperand != "" {
            let resultNum: Double = resultValue
            
            switch selectedOperand {
            case "×":
                resultValue = targetNum! * resultNum
            case "÷":
                if resultNum == 0 {
                    return
                }
                resultValue = targetNum! / resultNum
            case "+":
                resultValue = targetNum! + resultNum
            case "-":
                resultValue = targetNum! - resultNum
            default:
                break
            }
        }
        
        selectedOperand = ""
        targetNum = resultValue
    }

    @IBAction func crearAll(sender: UIButton) {
        targetNum = nil
        selectedOperand = ""
        resultValue = 0
    }

}

