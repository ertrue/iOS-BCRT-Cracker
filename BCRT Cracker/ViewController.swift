//
//  ViewController.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 10/31/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardshowtitle: numberInputerView!
    @IBOutlet weak var resultreporter: cardPoolStaticView!
    @IBOutlet weak var cardsstastic: cardPoolStaticView!
    
    var cardpool: cardPool?
    var userpref: UserPreference?
    var gamepref: GameOption?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userpref = UserPreference()
        gamepref = GameOption()
        
        cardpool = cardPool(setting: gamepref!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

