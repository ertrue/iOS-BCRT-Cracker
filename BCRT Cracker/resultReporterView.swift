//
//  resultReporterView.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/11/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import UIKit

@IBDesignable class resultReporterView: UIView {
    
    var view: UIView!

    @IBOutlet weak var playerbar: UIImageView!
    @IBOutlet weak var bankerbar: UIImageView!
    @IBOutlet weak var tiebar: UIImageView!
    @IBOutlet weak var pairbar: UIImageView!
    
    @IBOutlet weak var playerlabel: UILabel!
    @IBOutlet weak var bankerlabel: UILabel!
    @IBOutlet weak var tielabel: UILabel!
    @IBOutlet weak var pairlabel: UILabel!
    
    var playergain: CGFloat = 0
    var bankergain: CGFloat = 0
    var tiegain: CGFloat = 0
    var pairgain: CGFloat = 0
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        //        self.view = NSBundle.mainBundle().loadNibNamed("cardPoolStaticView", owner: self, options: nil)[0] as? UIView
        setup()
    }
    
    func setup()
    {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "resultReporterView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
}
