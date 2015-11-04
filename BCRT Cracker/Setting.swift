//
//  PlayerPreference.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/1/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import Foundation

// MARK: BaseSetting

class BaseSetting {
    var deckCnt:Int = 8
    
    // gain setting
    var bankerWinAward: float_t = 0.95
    var playerWinAward: float_t = 1.0
    var tieWinAward: float_t = 8.0
    var pairWinAward: float_t = 12.0
    init (deckCnt: Int?, bankerWinAward: float_t?, playerWinAward: float_t?, tieWinAward: float_t?, pairWinAward: float_t?) {
        if ((deckCnt) != nil) {
            self.deckCnt = deckCnt!
        }
        if ((bankerWinAward) != nil) {
            self.bankerWinAward = bankerWinAward!
        }
        if ((playerWinAward) != nil) {
            self.playerWinAward = playerWinAward!
        }
        if ((tieWinAward) != nil) {
            self.tieWinAward = tieWinAward!
        }
        if ((pairWinAward) != nil) {
            self.pairWinAward = pairWinAward!
        }
    }
}

// MARK: UserPreference

class UserPreference:BaseSetting {
    var threshold: float_t = 0.03
// The threshold is the final solution for to judge the bet
    func bankerBetThreshold() -> float_t {
        return threshold
    }
    func playerBetThreshold() -> float_t {
        return threshold
    }
    func tieBetThreshold() -> float_t {
        return threshold
    }
    func pairBetThreshold() -> float_t {
        return threshold
    }
}

// MARK: GameOption

class GameOption:BaseSetting {
    var cardReservePortion: float_t = 0.2
}