//
//  cardPool.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/4/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import Foundation




func cardPoint(number: Int) -> Int {
    if number>9 {
        return 0
    } else {
        return number
    }
}


class cardPool {
    var cardCnt = [Int](count: 13, repeatedValue: 0)
    var cards = [Int]()
    var gamesetting: GameOption
    
    var totalCardCnt: Int = 8*52
    
    func setCards() {
        cards = []
        for cardnum in 1...13 {
            let cardIndex = cardnum - 1
            for _ in 0..<self.cardCnt[cardIndex] {
                cards.append(cardnum)
            }
        }
    }
    
    init(setting: GameOption) {
        totalCardCnt=setting.deckCnt*52
        
        for i in 0..<13 {
            cardCnt[i] = setting.deckCnt*4
        }
        gamesetting = setting
        self.setCards()
    }
    

    
    func seeCard(currCard: Card) {
        cardCnt[currCard.number]--
        totalCardCnt--
        setCards()
    }
    
    func getRandomSixCards() -> [Int] {
        var res = [Int](count: 6, repeatedValue: 0)
        for i in 0..<6 {
            let targetIndex = randRange(i, upper: totalCardCnt)
            res[i] = cards[targetIndex]
            swap(&cards[i], &cards[targetIndex])
        }
        return res
    }
    
    // return -1: banker Win
    //         0: tie Win
    //         1: player Win
    
    func getWinTieLose(sixCards: [Int]) -> Int {
        
        var cardIt: Int = 4
        
        var player = (cardPoint(sixCards[0]) + cardPoint(sixCards[2]))%10
        var banker = (cardPoint(sixCards[0]) + cardPoint(sixCards[2]))%10
        
        if (banker < 8 && player < 8) { // Check Non-Natural Win;
            // player make decision first and then banker make the following decision
            var playerCard: Int = -1
            if (player <= 5) {
                playerCard = sixCards[cardIt++]
                player = (player+cardPoint(playerCard))%10
            }
            if (  (banker <= 2)
                || (banker == 3 && (playerCard == -1 || cardPoint(playerCard) != 8))
                || (banker == 4 && (playerCard == -1 || (cardPoint(playerCard)>=2 && cardPoint(playerCard)<=7)))
                || (banker == 5 && (playerCard == -1 || (cardPoint(playerCard)>=4 && cardPoint(playerCard)<=7)))
                || (banker == 6 && playerCard != -1 && cardPoint(playerCard)>=6 && cardPoint(playerCard)<=7))
            {
                banker = (banker+cardPoint(sixCards[cardIt]))%10
            }
        }
        
        if (banker > player) {
            return -1
        } else if (banker == player) {
            return 0
        } else {
            return 1
        }

    }
    
    func getBetChance(userSetting: UserPreference) -> (banker: float_t, player: float_t, tie: float_t, pair: float_t) {
        
        // get banker, player and tie ratio:
        var bankerCnt:Int = 0
        var tieCnt:Int = 0
        var playerCnt:Int = 0
        
        for _ in 0..<userSetting.testRound {
            let sixcards = getRandomSixCards()
            let result = getWinTieLose(sixcards)
            if (result == -1) {
                bankerCnt++
            }
            else if (result == 0) {
                tieCnt++
            }
            else {
                playerCnt++
            }
        }
        let pB = float_t(bankerCnt) / float_t(userSetting.testRound)
        let pT = float_t(tieCnt) / float_t(userSetting.testRound)
        let pP = float_t(playerCnt) / float_t(userSetting.testRound)
        
        let bankerExp = pB*gamesetting.bankerWinAward - pP
        let playerExp = pP*gamesetting.playerWinAward - pB
        let tieExp    = pT*gamesetting.tieWinAward - (1.0-pT)
        
        var pairCnt = 0
        for i in 0..<13 {
            pairCnt += cardCnt[i]*(cardCnt[i]-1)
        }
        let pPair = float_t(pairCnt)/float_t(totalCardCnt)/float_t(totalCardCnt)
        
        let pairExp = pPair * gamesetting.pairWinAward - (1-pPair)
        
        return (bankerExp, playerExp, tieExp, pairExp)
    }
    
}