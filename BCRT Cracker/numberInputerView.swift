//
//  CardNumberInputer.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/5/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import UIKit


@IBDesignable class numberInputerView: UIView {
    
    var view: UIView!
    
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titlePlayer: UILabel!
    @IBOutlet weak var titleBanker: UILabel!
    @IBOutlet weak var PlayerCard1: UILabel!
    @IBOutlet weak var PlayerCard2: UILabel!
    @IBOutlet weak var PlayerCard3: UILabel!
    @IBOutlet weak var BankerCard1: UILabel!
    @IBOutlet weak var BankerCard2: UILabel!
    @IBOutlet weak var BankerCard3: UILabel!
    @IBOutlet weak var titleStackView: UIStackView!
    @IBOutlet weak var cardStackView: UIStackView!
    
    let cardsize: CGFloat = 40
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    
    func setup()
    {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        
        addSubview(view)
        
//        setupTitle()
//        setupPlayerBankerCard()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "numberInputerView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    
}


