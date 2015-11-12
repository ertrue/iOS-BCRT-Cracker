//
//  oneBarView.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/10/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import UIKit

@IBDesignable class oneBarView: UIView {
    
    var view:UIView!
    
    var curr: Int = 32          // Current card number
    var maxH: CGFloat = 100     // Maximum bar Height
    var full: Int = 32          // Maximum card number
    
    @IBInspectable var fullCnt: Int {
        get {
            return full
        }
        set(fullCnt) {
            full = fullCnt
            updateView()
        }
    }
    
    @IBInspectable var maxHeight: CGFloat {
        get {
            return maxH
        }
        set (maxHeight) {
            maxH = maxHeight
            updateView()
        }
    }
    
    @IBInspectable var currCnt: Int {
        get {
            return curr
        }
        set (curreCnt) {
            curr = currCnt
            updateView()
        }
    }

    
    @IBOutlet weak var bar: UIView!
    @IBOutlet weak var caption: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    
    func setup()
    {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "oneBarView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func updateView() {
        let height: CGFloat = maxH/CGFloat(full)*CGFloat(curr)
        bar.frame.size = CGSize(width: bar.frame.width, height: height)
    }
    
}
