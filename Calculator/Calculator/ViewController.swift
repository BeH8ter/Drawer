//
//  ViewController.swift
//  Calculator
//
//  Created by Atlas on 19/06/2019.
//  Copyright © 2019 behater. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
     Make my personal calculator
     
     step1. Drag components using Label,textFeild,Buttons
     step2. Think how to progress
     step3. Do it
     
     */
    
    private let ACTION_CLEAR = 0
    private let ACTION_ADDITION = 1
    private let ACTION_SUBTRACTION = 2
    private let ACTION_MULTIPLICATION = 3
    private let ACTION_DIVISION = 4
    private let ACTION_CALCULATE = 5
    
    private let CLEAR_DISPLAY = 6
    private let CLEAR_DISPLAY_DATA = 7
    
    @IBOutlet weak var viewInput: UITextField!
    @IBOutlet weak var viewAnswer: UILabel!
    
    struct Container {
        var firstNum = 0.0
        var secondNum = 0.0
        var myOperator = 1
    }
    
    var values = Container()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func eventListener(_ sender: UIButton) {
        switch sender.tag {
        case ACTION_CLEAR:
            clearDisplay(clearType:CLEAR_DISPLAY,display: "0.0")
        case ACTION_ADDITION:
            saveData(numStr: viewInput.text, oper: ACTION_ADDITION)
        case ACTION_SUBTRACTION:
            saveData(numStr: viewInput.text , oper: ACTION_SUBTRACTION)
        case ACTION_MULTIPLICATION:
            saveData(numStr: viewInput.text , oper: ACTION_MULTIPLICATION)
        case ACTION_DIVISION:
            saveData(numStr: viewInput.text , oper: ACTION_DIVISION)
        case ACTION_CALCULATE:
            
            values.secondNum = Double(viewInput.text ?? "") ?? 0
            let result = calculate(values)
            clearDisplay(clearType:CLEAR_DISPLAY_DATA,display: String(result))

        default:
            break
        }
        
    }
    private func clearDisplay(clearType:Int,display:String){
        viewInput.text = ""
        viewAnswer.text = display
        
        if clearType == CLEAR_DISPLAY_DATA{
            values = Container()
        }
    }
    
    private func saveData(numStr:String? , oper:Int){
        values.firstNum = Double(numStr ?? "") ?? 0.0
        values.myOperator = oper
        viewInput.text = ""
    }
    
    
    //
    private func calculate(_ val: Container) -> Double{
        var result = 0.0
        switch val.myOperator {
        case ACTION_ADDITION:
            result = val.firstNum+val.secondNum
            return result
        case ACTION_SUBTRACTION:
            result = val.firstNum-val.secondNum
            return result
        case ACTION_MULTIPLICATION:
            result = val.firstNum*val.secondNum
            return result
        case ACTION_DIVISION:
            result = val.firstNum/val.secondNum
            return result
        default:
            print("There's no operator you've got")
            break
        }
        return result
    }
    
    
}

