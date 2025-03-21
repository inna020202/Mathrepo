//
//  TrainViewController.swift
//  MathrepoLessons
//
//  Created by Инна on 21.03.2025.
//

import Foundation
import UIKit

final class TrainViewController: UIViewController{
    
    //MARK: - Properties
    var type: MathTypes = .add{
        didSet {
            print(type)
        }
    }
}
