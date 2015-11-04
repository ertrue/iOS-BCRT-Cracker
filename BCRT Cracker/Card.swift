//
//  Card.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/1/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import UIKit

class Card {
    var number: Int = 0
    var suit: Int8?
    
    // MARK: initialization
    init?(number: Int, suit: Int8?) {
        self.number = number
        self.suit = suit
    }
    
    // MARK: member functions
    func pointer() -> Int {
        if number>9 {
            return 0
        } else {
            return number;
        }
    }
}