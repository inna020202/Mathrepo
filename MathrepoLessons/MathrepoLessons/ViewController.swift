//
//  ViewController.swift
//  MathrepoLessons
//
//  Created by Инна on 21.03.2025.
//

import UIKit

enum MathTypes: Double {
    case add, subtract, multiply, divide
}

class ViewController: UIViewController {
    //MARK: -IBOutlets
@IBOutlet var buttonCollections: [UIButton]!
    
    //MARK: - Properties
     private var selectedType: MathTypes = .add
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureButtons()
    }
    //MARK: - Actions
    @IBAction func buttonAction(_ sender: UIButton) {
        selectedType = MathTypes(rawValue: Double(sender.tag)) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
    
    @IBAction func unwindAction(unwindSegue:UIStoryboardSegue){ }
    
    //MARK: - Methods
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        if let viewController = segue.destination as? TrainViewController {
            viewController.type = selectedType
        }
    }
    
    private func  configureButtons(){
        //Add shadow
        buttonCollections.forEach { button in
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.4
            button.layer.shadowRadius = 3
        }
    }
}

