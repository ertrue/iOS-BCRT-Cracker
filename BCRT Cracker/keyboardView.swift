//
//  dailPadView.swift
//  BCRT Cracker
//
//  Created by Hongbo Zhang on 11/11/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import UIKit

@IBDesignable class keyboardView: UIView {
    
    var buttons = [UIButton]()
    let calcButton: UIButton = UIButton()
    let space: CGFloat = 4
    var width: CGFloat = 0
    var height: CGFloat = 0
    var wideW: CGFloat = 0
    
    let colNum: CGFloat = 4
    let rowNum: CGFloat = 4
    
    let captions:[String] = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "miss", "C", "Undo"]
    let calcCap: String = "Calc"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    
//    func loadViewFromNib() -> UIView {
//        let bundle = NSBundle(forClass: self.dynamicType)
//        let nib = UINib(nibName: "keyboardView", bundle: bundle)
//        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
//        
//        return view
//    }
    
    func setup() {
//        view = loadViewFromNib()
//        self.frame = bounds
        self.backgroundColor = UIColor.clearColor()
//        self.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        
        let W = self.frame.width
        let H = self.frame.height
        let wPitch = W/colNum
        let hPitch = H/rowNum
        
        width = wPitch - space
        height = hPitch - space
        wideW = W - space
        
        var index: Int = 0
        
        for row in 0..<Int(rowNum) {
            for col in 0..<Int(colNum) {
                let button = UIButton()
                
                button.setBackgroundImage(UIImage(named: "whitebutton"), forState: .Normal)
                
                button.setTitle(captions[index], forState: .Normal)
                
                button.bounds = CGRectMake(0, 0, width, height)
                button.center = CGPointMake(CGFloat(0.5+float_t(col))*wPitch, CGFloat(0.5+float_t(row))*hPitch)

                if (captions[index] == "miss") {
                    button.addTarget(self, action: "missButtonClick:", forControlEvents: .TouchDown)
                } else if (captions[index] == "C") {
                    button.addTarget(self, action: "clearButtonClick:", forControlEvents: .TouchDown)
                } else if (captions[index] == "Undo") {
                    button.addTarget(self, action: "undoButtonClick:", forControlEvents: .TouchDown)
                } else {
                    button.addTarget(self, action: "numButtonClick:", forControlEvents: .TouchDown)
                }
                
                buttons += [button]
                self.addSubview(button)
                index++
            }
        }
        
        calcButton.setBackgroundImage(UIImage(named: "whitebutton"), forState: .Normal)
        calcButton.layer.cornerRadius = 2
        calcButton.setTitle(calcCap, forState: .Normal)
        calcButton.bounds = CGRectMake(0, 0, wideW, height)
        calcButton.center = CGPointMake(W/2, H-hPitch/2)
        calcButton.addTarget(self, action: "calcButtonClick:", forControlEvents: .TouchDown)
        
        self.addSubview(calcButton)
    }
    
    func numButtonClick(button: UIButton) {
        
    }
    
    func missButtonClick(button: UIButton) {
        
    }
    
    func undoButtonClick(button: UIButton) {
        
    }
    
    func clearButtonClick(button: UIButton) {
        
    }
    
    func calcButtonClick(button: UIButton) {
        
    }
    
}


//class dailPadView2: UIView {
//    // MARK: Properties
//    
//    var currentInput = 0 {
//        didSet {
//            setNeedsLayout()
//        }
//    }
//    
//    var bankerCards = [Int]()
//    var playerCards = [Int]()
//    
//    var inputButtons = [UIButton]()
//    var cardLabels = [UILabel]()
//    
//    var bankerTitleLabel = UILabel()
//    var playerTitleLabel = UILabel()
//    
//    var spacing:CGFloat = 2
//    var size:CGFloat = 35
//    var rowCnt = 4
//    var colCnt = 4
//    
//    var buttonRegionWidth:CGFloat = 4
//    var labelRegionWidth:CGFloat = 4
//    var titleRegionHeight:CGFloat = 4
//    var cardRegionHeight:CGFloat = 4
//    var cardRegionWidth:CGFloat = 4
//    
//    let missCaption: String = "X"
//    
//    let captionList: [String] = ["C", "...", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "Run"]
//    
//    var currentTabIndex: Int = 0
//    var isMissAppear: Bool = false
//    var bankerPoint: Int = 0
//    var playerPoint: Int = 0
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        // add button on the right hand size
//        
//        let backgroundColor = UIColor.clearColor()
//        let fontRedColor = UIColor.redColor()
//        let fontBlackColor = UIColor.blackColor()
//        
//        var index: Int = 0
//        for _ in 0..<rowCnt {
//            for _ in 0..<colCnt {
//                let button = UIButton()
//                
//                // button corner rounding effect
//                button.backgroundColor = backgroundColor
//                button.setBackgroundImage(UIImage(named: "purplebutton"), forState: .Normal)
//                //                button.layer.cornerRadius = 5
//                //                button.layer.borderWidth = 1
//                //                button.layer.borderColor = UIColor.yellowColor().CGColor
//                
//                button.setTitle(captionList[index], forState: .Normal)
//                if (index-2)%2==0 {
//                    button.setTitleColor(fontBlackColor, forState: .Normal)
//                } else {
//                    button.setTitleColor(fontRedColor, forState: .Normal)
//                }
//                
//                button.adjustsImageWhenHighlighted = false
//                
//                button.addTarget(self, action: "cardButtonTapped:", forControlEvents: .TouchDown)
//                
//                inputButtons += [button]
//                addSubview(button)
//                index++
//            }
//        }
//        
//        // label layout placement
//        playerTitleLabel.text = "Player Cards:"
//        bankerTitleLabel.text = "Banker Cards:"
//        playerTitleLabel.textAlignment = .Center
//        bankerTitleLabel.textAlignment = .Center
//        playerTitleLabel.adjustsFontSizeToFitWidth = true
//        bankerTitleLabel.adjustsFontSizeToFitWidth = true
//        playerTitleLabel.textColor = UIColor.grayColor()
//        bankerTitleLabel.textColor = UIColor.grayColor()
//        
//        addSubview(playerTitleLabel)
//        addSubview(bankerTitleLabel)
//        
//        for _ in 0..<6 {
//            let label = UILabel()
//            
//            // label definition
//            label.textColor = UIColor.redColor()
//            label.adjustsFontSizeToFitWidth = true
//            label.textAlignment = NSTextAlignment.Center
//            label.text = missCaption;
//            label.backgroundColor = UIColor.whiteColor()
//            cardLabels += [label]
//            addSubview(label)
//        }
//    }
//    
//    override func layoutSubviews() {
//        // set the button size to a square the size
//        buttonRegionWidth = frame.size.height*3/4
//        labelRegionWidth = frame.size.width - buttonRegionWidth - spacing
//        
//        let buttonWidth = CGFloat(Int(buttonRegionWidth/4))
//        let buttonHeight = buttonWidth*4/3
//        var buttonFrame = CGRect(x:0, y:0, width:buttonWidth, height:buttonHeight)
//        
//        // Offset each button's origin
//        
//        for (index, button) in inputButtons.enumerate() {
//            buttonFrame.origin.x = CGFloat(index%colCnt)*(buttonWidth+spacing)+labelRegionWidth
//            buttonFrame.origin.y = CGFloat(index/colCnt)*(buttonHeight+spacing)
//            button.frame = buttonFrame
//        }
//        
//        // set the label size
//        
//        titleRegionHeight = buttonHeight/2
//        cardRegionHeight = (frame.size.height-buttonHeight-spacing)/2
//        cardRegionWidth = (labelRegionWidth-3*spacing)/3
//        
//        // place the title label
//        let topTitleFrame = CGRect(x:0, y:0, width:labelRegionWidth, height:titleRegionHeight)
//        var botTitleFrame = CGRect(x:0, y:0, width:labelRegionWidth, height:titleRegionHeight)
//        botTitleFrame.origin.y = titleRegionHeight + cardRegionHeight+spacing
//        
//        bankerTitleLabel.frame = topTitleFrame
//        playerTitleLabel.frame = botTitleFrame
//        
//        // place the banker card label
//        var cardFrame = CGRect(x:0, y:titleRegionHeight, width: cardRegionWidth, height: cardRegionHeight)
//        for (index, label) in cardLabels.enumerate() {
//            cardFrame.origin.x = CGFloat(index%3)*(spacing+cardRegionWidth)
//            if (index == 3) {
//                cardFrame.origin.y = titleRegionHeight*2+spacing+cardRegionHeight
//            }
//            label.frame = cardFrame
//        }
//        
//        updateCardSelectionState()
//    }
//    
//    override func intrinsicContentSize() -> CGSize {
//        
//        return frame.size
//    }
//    
//    // MARK: Button Action
//    
//    func cardButtonTapped(button: UIButton) {
//        let buttonIndex = inputButtons.indexOf(button)!
//        //        let cardNumber = buttonIndex-2
//        
//        if buttonIndex == 0 {
//            for i in 0..<6 {
//                cardLabels[i].text = "..."
//            }
//            currentTabIndex = 0
//            return
//        }
//            
//        else if buttonIndex == 1 { // when click missing button
//            if (currentTabIndex < 6) {
//                cardLabels[currentTabIndex++].text = "X"
//                isMissAppear = true
//            }
//            return
//        }
//            
//        else if (buttonIndex >= 2 && buttonIndex <= 14) { // real number
//            
//            if (currentTabIndex < 6) {
//                cardLabels[currentTabIndex++].text = captionList[buttonIndex]
//            }
//            return
//        }
//            
//        else if (buttonIndex == 15) {
//            // Enter
//            // need to notify the modeler of card prediction.
//            // show the real prediction
//            // need to notify the history
//            
//            // clean all the note
//            currentTabIndex = 0
//            isMissAppear = false
//            bankerPoint = 0
//            playerPoint = 0
//            
//            for i in 0..<6 {
//                cardLabels[i].text = "..."
//            }
//        }
//    }
//    
//    func updateCardSelectionState() {
//        
//    }
//}
