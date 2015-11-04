//
//  CurrentHandControl.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/1/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

// import Cocoa
import UIKit

class CurrentHandControl: UIView {
    
    // MARK: Properties
    var buttonSpacing = 5
    var buttonWidth = 10
    
    
    var bankerCard = [Int]()
    var playerCard = [Int]()
    
    var cardButtons = [UIButton]()
    
    var clearButton = UIButton()
    var missButton = UIButton()
    var enterButton = UIButton()
    
    var totalButtonNum = 16
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for index in 1..<totalButtonNum {
            let button = UIButton()
            button.setTitle(<#T##title: String?##String?#>, forState: <#T##UIControlState#>)
        }
    }

}
