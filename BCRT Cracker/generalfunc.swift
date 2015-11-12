//
//  generalfunc.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/10/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import Foundation
import UIKit

func randRange (lower: Int , upper: Int) -> Int {
    return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
}

func greymap (index: Int, upper: Int) -> UIColor {
    let color: CGFloat = CGFloat(255.0/float_t(upper) * float_t(index))
    
    return UIColor(red: color, green: color, blue: color, alpha: 1.0)
    
}