//
//  ViewController.swift
//  BullsEye
//
//  Created by RayShin Lee on 2022/3/27.
//  Copyright © 2022 RayShin Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
      let roundedValue = slider.value.rounded()
      currentValue = Int(roundedValue)
      targetValue = Int.random(in: 1...100)
      startNewGame()
      
      let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
      slider.setThumbImage(thumbImageNormal, for: .normal)
      let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
      slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
      
      let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
      
      let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
      let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
      slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
      
      let trackRightImage = #imageLiteral(resourceName: "SliderTrackLeft")
      let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
      slider.setMaximumTrackImage(trackRightResizable, for: .normal)
  }

  @IBAction func showAlert() {
      
//      var difference: Int
//      if currentValue > targetValue{
//          difference = currentValue - targetValue
//      } else if targetValue > currentValue{
//          difference = targetValue - currentValue
//      } else {
//          difference = 0
//      }
      
//      var difference = currentValue - targetValue
//      if difference < 0 {
//          difference = difference * -1
//      }
      
      let difference = abs(targetValue - currentValue)
      var points = 100 - difference
      score += points
      
      let title: String
      if difference == 0 {
          title = "Perfect!"
          points += 100
      } else if difference < 5 {
          title = "Almost there!"
          if difference == 1{
          points += 50
          }
      } else if difference < 10 {
          title = "Pretty good"
      }else {
          title = "You suck!"
      }
      
      
    let message = "You scored \(points) points"
            
    
 //   let message = "The value of the slider is now: \(currentValue)" + "\n The target value is: \(targetValue)" + "\n The difference is: \(difference)"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
      
    startNewRound()
    
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    let roundedValue = slider.value.rounded()
    currentValue = Int(roundedValue)
  }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
        
        func updateLabels(){
            targetLabel.text = String(targetValue)
            scoreLabel.text = String(score)
            roundLabel.text = String(round)
            
        }
    
   @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    
}



