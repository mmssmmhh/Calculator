//
//  ViewController.swift
//  Calculator
//
//  Created by Mohamed Kelany on 3/10/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ResultLabel: UILabel!
    
    let Brain : BrainCalculator = BrainCalculator()
    

    @IBAction func MinusPlusButtonAction(_ sender: UIButton) {
        ResultLabel.text = String(Double(ResultLabel.text!)! * -1)
    }
    
    
    @IBAction func HundredPercent(_ sender: UIButton) {
        ResultLabel.text = String(Double(ResultLabel.text!)! / 100)
        
    }
    @IBAction func ButtonsAction(_ sender: UIButton) {
        if ResultLabel.text == "0" { ResultLabel.text = "" }
        
        if sender.tag == -1{
            if !ResultLabel.text!.contains("."){
            ResultLabel.text = ResultLabel.text! + "."
            }
        } else {
            ResultLabel.text = ResultLabel.text! + String(sender.tag)
        }
    }
    @IBAction func ACbuttonAction(_ sender: UIButton) {
        ResultLabel.text = "0"
        Brain.Restart()
    }
    var LastOperation : String = ""
    var LastNumber : Double = 0.0
    @IBAction func OperationsButtonAction(_ sender: UIButton) {
        Brain.Add(Number: Double(ResultLabel.text!)!, with: Character(sender.titleLabel!.text!))
        ResultLabel.text = "0"
        if sender.titleLabel!.text! == "=" {
            ResultLabel.text = Brain.Result()
            Brain.Restart()
        } else{
            ResultLabel.text = "0"
        }

    }
    @IBOutlet weak var ShadowView: UIView!
    var gradientLayer: CAGradientLayer!
    override var preferredStatusBarStyle: UIStatusBarStyle {return .lightContent}

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        createGradientLayer()
    }
    
    func createGradientLayer(){
        gradientLayer = CAGradientLayer()
        
        let firstColor = UIColor.init(red: 61/255, green: 84/255, blue: 168/255, alpha: 1)
        let secondColor = UIColor.init(red: 104/255, green: 120/255, blue: 188/255, alpha: 1)
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.zPosition = -1
        self.ShadowView.layer.addSublayer(gradientLayer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = self.ShadowView.bounds
    }
    
    
    
    
    
    


}

