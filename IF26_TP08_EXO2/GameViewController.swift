//
//  GameViewController.swift
//  IF26_TP08_EXO2
//
//  Created by Jean-baptiste Blot on 14/11/2017.
//  Copyright © 2017 Jean-baptiste Blot. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var buttonInput: UIButton!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var borneMinLabel: UILabel!
    @IBOutlet weak var borneMaxLabel: UILabel!
    @IBOutlet weak var nbreEssaiLabel: UILabel!
    
    func random(min : Int, max : Int) -> Int {
        let plage = max - min
        let number = Int(arc4random_uniform(UInt32(plage))) + min
        
        return number
    }
    let borneMinDefault = 0
    let borneMaxDefault = 1000
    
    var nbreEssai = 0
    var borneMin = 0
    var borneMax = 1000
    var numberToFind = 0
    
    func startGame() {
        nbreEssai = 0
        borneMin = borneMinDefault
        borneMax = borneMaxDefault
        numberToFind = random(min: borneMin, max: borneMax)
        
        gameLabel.text = ""
        textInput.isEnabled = true
        buttonInput.setTitle ("Valider", for: .normal)
        updateDisplay()
    }
    func updateDisplay() {
        borneMinLabel.text = String(borneMin)
        borneMaxLabel.text = String(borneMax)
        nbreEssaiLabel.text = String(nbreEssai)
    }
    @IBAction func buttonClicked(_ sender: Any) {
        let textInputText = textInput.text ?? ""
        if (!textInput.isEnabled) {
            startGame()
        }
        else if (textInputText.count > 0) {
            let value = Int(textInputText) ?? -1
            
            if(value < borneMin || value > borneMax) {
                gameLabel.text = "Merci de rentrer un nombre dans les bornes"
            }
            else if (value < numberToFind) {
                nbreEssai += 1
                gameLabel.text = "Plus grand"
                borneMin = value
                updateDisplay()
            }
            else if (value > numberToFind) {
                nbreEssai += 1
                gameLabel.text = "Plus petit"
                borneMax = value
                updateDisplay()
            }
            else if (value == numberToFind) {
                gameLabel.text = "Félicitation ! \n Nombre d'essais : \n " + String(nbreEssai)
                
                textInput.isEnabled = false
                textInput.text = ""
                buttonInput.setTitle ("Rejouer", for: .normal)
            }
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
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
