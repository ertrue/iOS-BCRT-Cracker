//
//  cardPoolStaticView.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/10/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class cardPoolStaticView: UIView {
    var view: UIView!
    @IBOutlet weak var stackview: UIStackView!
    
    var barviews:[UIView] = []
    
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
        
        // add the bar for each oneBarView
        
        setupBarViews()
    }
    
    func setupBarViews() {
        for i in 0..<13 {
            
            let currview = UIView(frame:CGRectMake(0, 0, 30, 100))
            currview.autoresizingMask = [UIViewAutoresizing.FlexibleHeight]
            
            currview.backgroundColor = greymap(i, upper: 13)
            barviews.append(currview)
            stackview.addSubview(currview)
            
        }
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "cardPoolStaticView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }

    
}



//class cardPoolStaticView2 : UIView {
//
//    var view: UIView!
//    
//    var cardCount:[Int] = []
//    
//    var bars:[oneBarView] = []
//    
//    var barLength: CGFloat = 100
//    let barWidth: CGFloat = 20
//    
//    var barSpace: CGFloat = 8
//    var barFullHeight: CGFloat = 100
//    
//    var orgPosition: [CGPoint] = []
//    
//    let labelSize: CGFloat = 20
//    
//    let captions:[String] = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
//    let totalNumberCnt: Int = 13
//    
//    let fullValue: Int = 32
//    
//    @IBOutlet weak var totalCntLabel: UILabel!
//
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder:aDecoder)
////        self.view = NSBundle.mainBundle().loadNibNamed("cardPoolStaticView", owner: self, options: nil)[0] as? UIView
//        setup()
//    }
//
//    func setup()
//    {
//        view = loadViewFromNib()
//        view.frame = bounds
//        view.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
//        
//        addSubview(view)
//        
//        // add the bar for each oneBarView
//        
//        setupBarViews()
//    }
//    
//    func setupBarViews() {
//        
//        totalCntLabel.text = String(fullValue)
//        
//        barSpace = (self.view.frame.width-labelSize)/13-labelSize
//        barFullHeight = self.view.frame.height-1.5*labelSize
//        
//        var xorg: CGFloat = barSpace/2+labelSize
//        let yorg: CGFloat = labelSize/2
//        
//        for _ in 0..<totalNumberCnt {
//            orgPosition.append(CGPoint(x: xorg, y: yorg))
//            xorg = xorg + barSpace+barWidth
//        }
//        
//        for i in 0..<totalNumberCnt {
//            
//            let barview = oneBarView(frame: CGRect(origin: orgPosition[i], size: CGSize(width: labelSize, height: barFullHeight+labelSize)))
//            
//            barview.bar.backgroundColor = greymap(i+1, upper: totalNumberCnt+2)
//            barview.caption.text = captions[i]
//            barview.maxHeight = barFullHeight
//            barview.currCnt = fullValue
//            barview.fullCnt = fullValue
//            
//            addSubview(barview)
//            bars.append(barview)
//        }
//    }
//    
//    func loadViewFromNib() -> UIView {
//        let bundle = NSBundle(forClass: self.dynamicType)
//        let nib = UINib(nibName: "cardPoolStaticView", bundle: bundle)
//        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
//        
//        return view
//    }
//}