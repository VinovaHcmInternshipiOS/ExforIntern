//
//  CalcViewController.swift
//  Calculator
//
//  Created by nguyen gia huy on 05/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var bt19: UIButton!
    @IBOutlet weak var bt18: UIButton!
    @IBOutlet weak var bt17: UIButton!
    @IBOutlet weak var bt16: UIButton!
    @IBOutlet weak var bt15: UIButton!
    @IBOutlet weak var bt14: UIButton!
    @IBOutlet weak var bt13: UIButton!
    @IBOutlet weak var bt12: UIButton!
    @IBOutlet weak var bt11: UIButton!
    @IBOutlet weak var bt10: UIButton!
    @IBOutlet weak var bt9: UIButton!
    @IBOutlet weak var bt8: UIButton!
    @IBOutlet weak var bt7: UIButton!
    @IBOutlet weak var bt6: UIButton!
    @IBOutlet weak var bt5: UIButton!
    @IBOutlet weak var bt4: UIButton!
    @IBOutlet weak var bt3: UIButton!
    @IBOutlet weak var bt2: UIButton!
    @IBOutlet weak var bt1: UIButton!
    @IBOutlet weak var leadingStack: NSLayoutConstraint!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var trailingStack: NSLayoutConstraint!
    var stateValue = false
    var stateCountNumber = true
    let maxNumber = 18
    let dotNumber = [3,7,11,15]
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var midNumber : Double = 0
    var sum : Double = 0
    var operation = 0
    var operation2 = 0
    let numbers = ["0","1","2","3","4","5","6","7","8","9"]
    override func viewDidLoad() {
        super.viewDidLoad()
        lbNumber.adjustsFontSizeToFitWidth = true
        lbNumber.text = "0"
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        switch UIDevice.current.orientation{
        case .portrait:
            circleButtonPortrait()
        case .portraitUpsideDown:
            circleButtonPortrait()
        case .landscapeLeft:
            circleButtonLandscape()
        case .landscapeRight:
            circleButtonLandscape()
        default:
            print("Other")
        }

    }
    private func circleButtonPortrait(){

        bt1.layer.cornerRadius = bt1.frame.width / 2.1
        bt2.layer.cornerRadius = bt2.frame.width / 2.1
        bt3.layer.cornerRadius = bt3.frame.width / 2.1
        bt4.layer.cornerRadius = bt4.frame.width / 2.1
        bt5.layer.cornerRadius = bt5.frame.width / 2.1
        bt6.layer.cornerRadius = bt6.frame.width / 2.1
        bt7.layer.cornerRadius = bt7.frame.width / 2.1
        bt8.layer.cornerRadius = bt8.frame.width / 2.1
        bt9.layer.cornerRadius = bt9.frame.width / 2.1
        bt10.layer.cornerRadius = bt10.frame.width / 2.1
        bt11.layer.cornerRadius = bt11.frame.width / 2.1
        bt12.layer.cornerRadius = bt12.frame.width / 2.1
        bt13.layer.cornerRadius = bt13.frame.width / 2.1
        bt14.layer.cornerRadius = bt14.frame.width / 2.1
        bt15.layer.cornerRadius = bt15.frame.width / 2.1
        bt16.layer.cornerRadius = bt16.frame.width / 2.1
        bt17.layer.cornerRadius = bt17.frame.width / 5.1
        bt18.layer.cornerRadius = bt18.frame.width / 2.1
        bt19.layer.cornerRadius = bt19.frame.width / 2.1
    }
    private func circleButtonLandscape(){
        bt1.layer.cornerRadius = bt1.frame.width / 7
        bt1.layer.cornerRadius = bt1.frame.width / 7
        bt2.layer.cornerRadius = bt2.frame.width / 7
        bt3.layer.cornerRadius = bt3.frame.width / 7
        bt4.layer.cornerRadius = bt4.frame.width / 7
        bt5.layer.cornerRadius = bt5.frame.width / 7
        bt6.layer.cornerRadius = bt6.frame.width / 7
        bt7.layer.cornerRadius = bt7.frame.width / 7
        bt8.layer.cornerRadius = bt8.frame.width / 7
        bt9.layer.cornerRadius = bt9.frame.width / 7
        bt10.layer.cornerRadius = bt10.frame.width / 7
        bt11.layer.cornerRadius = bt11.frame.width / 7
        bt12.layer.cornerRadius = bt12.frame.width / 7
        bt13.layer.cornerRadius = bt13.frame.width / 7
        bt14.layer.cornerRadius = bt14.frame.width / 7
        bt15.layer.cornerRadius = bt15.frame.width / 7
        bt16.layer.cornerRadius = bt16.frame.width / 7
        bt17.layer.cornerRadius = bt17.frame.width / 14
        bt18.layer.cornerRadius = bt18.frame.width / 7
        bt19.layer.cornerRadius = bt19.frame.width / 7
    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        switch UIDevice.current.orientation{
        case .portrait:
            circleButtonPortrait()
        case .portraitUpsideDown:
            circleButtonLandscape()
        case .landscapeLeft:
            circleButtonLandscape()
           
        case .landscapeRight:
            circleButtonLandscape()
            
        default:
            print("Other")
        }
        
    }

    func leadingtrailing(num:CGFloat)
    {
        leadingStack.constant = num
        trailingStack.constant = num
    }
    @IBAction func operation(_ sender: UIButton) {
        
        if lbNumber.text != "0" && sender.tag != 11 && sender.tag != 16
        {
            midNumber = previousNumber
            previousNumber = Double(lbNumber.text!)!
           
 
            
          /*  switch sender.tag {
            case 12://Divide
                print("sum",sum,"numberonscreen",numberOnScreen,"previous",previousNumber,"mid",midNumber)
                if(sum == 0)
                {
                    sum = midNumber / previousNumber
                    
                }
                else
                {
                    sum = sum / previousNumber
                    
                }
                lbNumber.text = String(sum)
            case 13://Mul
               
               if(sum == 0)
                {
                   sum = (previousNumber * numberOnScreen) + midNumber
                    
                }
                else
                {
                   
                    sum = sum * previousNumber
                   
                }
                 lbNumber.text = String(sum)
            case 14: //Minus
                print("sum",sum,"numberonscreen",numberOnScreen,"previous",previousNumber,"mid",midNumber)
                if(midNumber == 0)
                {
                    sum = numberOnScreen - midNumber
                    
                }
                else
                {
                    sum = sum - numberOnScreen
                    
                }
                lbNumber.text = String(sum)
            case 15: //Plus
               
                if(sum == 0)
                {
                    sum = midNumber + previousNumber
                }
                else
                {
                    sum = sum + previousNumber
                }
                lbNumber.text = String(sum)
                
                
            default:
                print("")
            }
*/
            operation2 = operation
            operation = sender.tag
            
            print(1,operation)
             print(2,operation2)
            stateValue = true;
            
        }
        else if sender.tag == 16 {
            
            switch operation {
            case 12://Divide
                    sum = (previousNumber / numberOnScreen) //+ midNumber
                    lbNumber.text = String(sum)
            case 13://Mul
                sum = previousNumber * numberOnScreen
               /* if(operation2 == 14)
                {
                    sum = midNumber - (previousNumber * numberOnScreen)
                    lbNumber.text = String(sum)
                   // print("sum",sum,"numberonscreen",numberOnScreen,"previous",previousNumber,"mid",midNumber)
                }
                else
                {
                    sum = (previousNumber * numberOnScreen) + midNumber
                    lbNumber.text = String(sum)
                }*/
                lbNumber.text = String(sum)
                    
            case 14: //Minus
                sum = previousNumber - numberOnScreen
                // print("sum",sum,"numberonscreen",numberOnScreen,"previous",previousNumber,"mid",midNumber)
             /*   if(previousNumber == numberOnScreen)
                {
                    
                }
                else
                {
                    sum = previousNumber + numberOnScreen
                    
                }*/
                lbNumber.text = String(sum)//previousNumber - numberOnScreen)
            case 15: //Plus
                print("sum",sum,"numberonscreen",numberOnScreen,"previous",previousNumber,"mid",midNumber)
                lbNumber.text = String(previousNumber + numberOnScreen)
               // print("sum",sum,"numberonscreen",numberOnScreen,"previous",previousNumber,"mid",midNumber)
            default:
                print("")
            }


        }

        else if sender.tag == 11{ //AC

        lbNumber.text = "0"
            
        sum = 0
        midNumber = 0

        previousNumber = 0

        numberOnScreen = 0

        operation = 0
        operation2 = 0

        }
        
    }
    @IBAction func number(_ sender: UIButton) {
        if stateValue {
            lbNumber.text = "\(sender.tag)"
            numberOnScreen = Double(lbNumber.text!)!
            stateValue = false
            print("NumberOnScreen",numberOnScreen)
        }
        else
        {
            if(lbNumber.text == "0")
            {
                lbNumber.text = ""
                lbNumber.text = "\(sender.tag)"
                numberOnScreen = Double(lbNumber.text!)!
            }
            else
            {
                lbNumber.text = lbNumber.text! + "\(sender.tag)"
                numberOnScreen = Double(lbNumber.text!)!
            }
            print("NumberOnScreen",numberOnScreen)
            /*if(lbNumber.text!.count <= maxNumber )
            {
                lbNumber.text = lbNumber.text! + "\(sender.tag)"
            }
            else
            {
                lbNumber.text = lbNumber.text!
            }*/
        }
        
    }
    @IBAction func btAC(_ sender: Any) {
        lbNumber.text = "\(numbers[0])"
    }
    @IBAction func btPM(_ sender: Any) {
    }
    @IBAction func btPercent(_ sender: Any) {
    }
    private func inputNumber(str: String) {
        if stateValue {
            lbNumber.text = "\(str)"
            stateValue = false
        }
        else
        {
            if(lbNumber.text!.count <= maxNumber )
            {
                lbNumber.text = lbNumber.text! + "\(str)"
            }
            else
            {
                lbNumber.text = lbNumber.text!
            }
        }
    }
    @IBAction func btPlus(_ sender: Any) {
    }
    @IBAction func bt0(_ sender: Any) {
        if stateValue {
            lbNumber.text = "\(numbers[0])"
            stateValue = false
        }
        else
        {
            if(lbNumber.text!.count <= maxNumber )
            {
                if(lbNumber.text != "0")
                {
                    
                    lbNumber.text = lbNumber.text! + "\(numbers[0])"
                    
                }
                
                
                
            }
            else
            {
                lbNumber.text = lbNumber.text!
            }
        }
    }
    @IBAction func btDot(_ sender: Any) {
        let string = lbNumber.text
        let charset = CharacterSet(charactersIn: ".")
        if string!.rangeOfCharacter(from: charset) != nil {
            
        }
        else{
            lbNumber.text = lbNumber.text! + "."
        }
        
    }
    private func checkDot()-> Bool{
        let string = lbNumber.text
        let charset = CharacterSet(charactersIn: ".")
        if string!.rangeOfCharacter(from: charset) != nil
        {
            return false
        }
        else
        {
            return true
        }
        
    }
    @IBAction func btEqual(_ sender: Any) {
    }
    
}
