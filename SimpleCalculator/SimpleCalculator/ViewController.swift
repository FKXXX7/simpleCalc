//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by СЕДЬМОЙ ВОСЬМОЙ on 8.03.21.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0;
    var previostNumber: Double = 0;
    var perfmath = false;
    var operation = 0;
    
    @IBOutlet weak var TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Buttons(_ sender: UIButton) {
        if perfmath == true {
            TextField.text = String(sender.tag - 1)
            numberOnScreen = Double(TextField.text!)!
            perfmath = false
        }
        else {
            TextField.text = TextField.text! + String(sender.tag - 1)
            numberOnScreen = Double(TextField.text!)!
        }
    }
    
    @IBAction func Signs(_ sender: UIButton) {
        if TextField.text != "" && sender.tag != 11 && sender.tag != 16 {
            previostNumber = Double(TextField.text!)!
            
            if sender.tag == 12 {
                //TextField.text = "/"
            }
            if sender.tag == 13 {
                //TextField.text = "x"
            }
            if sender.tag == 14 {
                //TextField.text = "-"
            }
            if sender.tag == 15 {
                //TextField.text = "+"
            }
            
            operation = sender.tag
            perfmath = true
        }
        else if sender.tag == 16 {
            if operation == 12 {
                TextField.text = String(previostNumber / numberOnScreen)
            }
            else if operation == 13 {
                TextField.text = String(previostNumber * numberOnScreen)
            }
            else if operation == 14 {
                TextField.text = String(previostNumber - numberOnScreen)
            }
            else if operation == 15 {
                TextField.text = String(previostNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11 {
            if TextField.text!.contains(".") {
                TextField.text = TextField.text! + ""
            }
            else {
                TextField.text = TextField.text! + "."
            }
            numberOnScreen = Double(TextField.text!)!
        }
    }
    
    @IBAction func Clear(_ sender: UIButton) {
        TextField.text?.removeAll()
    }
    
    @IBAction func Percent(_ sender: UIButton) {
        TextField.text = String(numberOnScreen / 100)
    }
    
    @IBAction func Change(_ sender: UIButton) {
        if ((TextField.text!.contains("-"))) {
            TextField.text?.remove(at: TextField.text!.startIndex)
            print("+")
        }
        else{
            TextField.text?.insert("-", at: TextField.text!.startIndex)
            print("-")
        }
    }
}
