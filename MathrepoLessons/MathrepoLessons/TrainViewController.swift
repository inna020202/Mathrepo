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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       configureButton()
    }
    private func  configureButton(){
        //Add shadow
        buttonCololections.forEach { button in
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.4
            button.layer.shadowRadius = 3
        }
    }
    
    
    
    //MARK: - Properties
    var type: MathTypes = .add{
        didSet {
            print(type)
        }
    }
}
