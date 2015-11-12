//
//  DaiUIButton.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/5/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import UIKit

class DaiUIButton: UIButton {

    // buttonIndex represents the button meaning and show
    // 1~13, clear, Miss, Enter
    
    var buttonIndex: Int = 0
    
    func setupOutFit() {
        self.sizeToFit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupOutFit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupOutFit()
        
    }
}
