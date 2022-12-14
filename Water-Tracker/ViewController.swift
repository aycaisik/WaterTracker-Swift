//
//  ViewController.swift
//  Water-Tracker
//
//  Created by Ayça Işık on 2.12.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -UI ELEMENTS
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var aaddwaterConstraint: NSLayoutConstraint!
    
    
    //MARK: -PROPERTIES
    
    let waterStore = DataStore()
    let targetAmount = 2700.0
    
    
    
    //MARK: -LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        //   myButton.setImage(UIImage(named: //"pngwing.com-3.png"), for: //.normal)
        
        
        
        updateAppeareance()
        
    }
    
    //MARK: -FUNCTIONS
    func updateWaterLevel(Amount:Double){
        let screenHeight = Double(view.frame.size.height)
        let ratio = Amount/targetAmount
        let calculatedHeight = screenHeight * ratio
        aaddwaterConstraint.constant=CGFloat(calculatedHeight)
        UIViewPropertyAnimator.init(duration: 0.5, dampingRatio: 0.75)  {
            
            self.view.layoutIfNeeded()
        }.startAnimation()
    }
        
        func updateLabels(amount: Double){
            let amountToTarget = (targetAmount-amount) / 1000
            
            if amount < targetAmount {
                let subtitleText = String(format:"you need to drink \n%g more liters for today's water need",amountToTarget)
                subtitleLabel.text = subtitleText
                if amount == 0 {
                    titleLabel.text = "Hello! \n Did you drink water today?"
                }else{
                    titleLabel.text = "Bravo! \n You are on the right way."
                }
            }else{
                titleLabel.text = "Good job"
            }
            
        }
        func updateAppeareance(){
            
            let currentWaterAmount = waterStore.getCurrentAmount()
            updateLabels(amount: currentWaterAmount)
            updateWaterLevel(Amount: currentWaterAmount)
            
        }
        //MARK: -ACTIONS
        func addwaterbuttontapped(_ sender: Any) {
            var waterAmount = 0.0
             
            switch (sender as AnyObject).tag{
            case 0:
                waterAmount=200
            case 1:
                waterAmount=500
            case 2:
                waterAmount=800
            default:
                break
            }
            waterStore.addWater(amount: waterAmount)
            updateAppeareance()
            
            
            
        }
        
        
    
}

    
