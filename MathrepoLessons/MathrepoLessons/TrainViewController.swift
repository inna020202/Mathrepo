//
//  TrainViewController.swift
//  MathrepoLessons
//
//  Created by Инна on 21.03.2025.
//

import Foundation
import UIKit

final class TrainViewController: UIViewController{
    
    @IBOutlet var buttonCololections: [UIButton]!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    //MARK: - Properties
    private var firstNumber: Double = 0.0
    private var secondNumber: Double = 0.0
   // private var selectedOperation: Int = 0
   // private var correctAnswer: Double = 0.0
    private var sign: String = ""
    private var count: Int = 0 {
        didSet {
            print("Count: \(count)")
        }
    }
    
    var type: MathTypes = .add{
        didSet {
            switch type {
            case .add:
                sign = "+"
            case .subtract:
                sign  = "-"
            case .multiply:
                  sign = "*"
            case .divide:
                sign = "/"
            }
        }
    }
  
            
    var  answer: Double {
       switch type {
       case .add:
          return  firstNumber + secondNumber
      case .subtract:
          return firstNumber - secondNumber
       case .multiply:
   return firstNumber * secondNumber
       case .divide:
      return    firstNumber/secondNumber

       }
}
            
               

    //MARK: - life cycle
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        configureQuestion()
        configureButton()
        }
    
    //MARK: - IBActions
    @IBAction func leftAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    //MARK: - Methods
    private func  configureButton(){
        let buttonsArray = [leftButton,rightButton]
        buttonsArray.forEach { button in
            button?.backgroundColor = .systemYellow
        //Add shadow
            buttonsArray.forEach { button in
            button?.layer.shadowColor = UIColor.darkGray.cgColor
            button?.layer.shadowOffset = CGSize(width: 0, height: 2)
            button?.layer.shadowOpacity = 0.4
            button?.layer.shadowRadius = 3
        }
        }
    
    
              if Bool.random() {
                rightButton.setTitle(String(format: "%.2f",answer ), for: .normal)
                leftButton.setTitle(String(format: "%.2f", generateRandomAnswer()), for: .normal)
            } else {
                leftButton.setTitle(String(format: "%.2f",answer ), for: .normal)
                rightButton.setTitle(String(format: "%.2f", generateRandomAnswer()), for: .normal)
            }
            
            
           
            func generateRandomAnswer() -> Double{
                let randomOffset = Double(Int.random(in: 1...99))
                return answer + (randomOffset == 0 ? 1 : randomOffset)
            }
    }
            
           

            func configureQuestion () {
     firstNumber = Double(Int.random (in: 1...99))
      secondNumber = Double(Int.random (in: 1...99))
     
   
      
      let question: String = "\(firstNumber) \(sign) \(secondNumber) = "
      questionLabel.text  = question
   }
//private func check (answer: String, for button: UIButton) {
     // let isRightAnswer = Int(answer) == self.answer
    func check (answer: String, for button: UIButton) {
           //let isRightAnswer = Int(answer) == self.answer
        let isRightAnswer = Double(answer)  == self.answer
        button.backgroundColor = isRightAnswer  ? .green : .red
        
    if isRightAnswer {
        let isSecondAttempt =  rightButton.backgroundColor == .red  || leftButton.backgroundColor == .red
        
        if !isSecondAttempt{
        count += 1
        }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.configureQuestion()
                self?.configureButton()
                
            }
        }
    }
        }
    
    
    
    
    
    
    
