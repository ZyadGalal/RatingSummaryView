//
//  RatingSummaryView.swift
//  RatingSummaryReview
//
//  Created by macOS on 11/14/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

@IBDesignable
 class RatingSummaryView: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var currentAverageLabel: UILabel!
    @IBOutlet weak var totalAverageLabel: UILabel!
    @IBOutlet weak var fiveRatingProgressView: UIProgressView!
    @IBOutlet weak var fourRatingProgressView: UIProgressView!
    @IBOutlet weak var threeRatingProgressView: UIProgressView!
    @IBOutlet weak var twoRatingProgressView: UIProgressView!
    @IBOutlet weak var oneRatingProgressView: UIProgressView!
    
    @IBOutlet weak var totalRatingLabel: UILabel!
    
    //MARK :- Public Inspectable
    @IBInspectable public var animationTime : CGFloat = 1.0

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Setup view from .xib file
        xibSetup()
    }
    
    
    func calculateStarsValues(totalRating : Float , fiveStars:Float , fourStars:Float , threeStars:Float, twoStars:Float, oneStar:Float){
        if totalRating == (fiveStars + fourStars + threeStars + twoStars + oneStar){
            let totalRating = totalRating
            //calculate average for every progress view
            let fiveStarsAverage = Float(fiveStars / totalRating)
            let fourStarsAverage = Float(fourStars / totalRating)
            let threeStarsAverage = Float(threeStars / totalRating)
            let twoStarsAverage = Float(twoStars / totalRating)
            let oneStarAverage = Float(oneStar / totalRating)
            let average = Float(((fiveStars * 5.0) + (fourStars * 4.0) + (threeStars * 3.0) + (twoStars * 2.0) + (oneStar * 1.0)) / totalRating)
            
            //set text to total rating label
            self.totalRatingLabel.text = "\(totalRating) Ratings"
            //formate average number to frist float digit
            let averageFormatter = String(format: "%.1f", average)
            self.currentAverageLabel.text = "\(averageFormatter)"
            
            setValuesForProgressBars(fiveStarsProgress: fiveStarsAverage, fourStarsProgress: fourStarsAverage, threeStarsProgress: threeStarsAverage, twoStarsProgress: twoStarsAverage, oneStarsProgress: oneStarAverage)
            
        }
        else{
            fatalError("total rating must be equal to the sum of all stars")
        }
    }
    //set starts value for every progress view
    func setValuesForProgressBars(fiveStarsProgress : Float ,fourStarsProgress : Float ,threeStarsProgress : Float ,twoStarsProgress : Float ,oneStarsProgress : Float ){
        UIView.animate(withDuration: animationTime) {
            self.fiveRatingProgressView.setProgress(fiveStarsProgress, animated: true)
            self.fourRatingProgressView.setProgress(fourStarsProgress, animated: true)
            self.threeRatingProgressView.setProgress(threeStarsProgress, animated: true)
            self.twoRatingProgressView.setProgress(twoStarsProgress, animated: true)
            self.oneRatingProgressView.setProgress(oneStarsProgress, animated: true)
        }
        
    }
    
}
private extension RatingSummaryView {
    
    func xibSetup() {
        backgroundColor = UIColor.white
        containerView = loadNib()
        // use bounds not frame or it'll be offset
        containerView.frame = bounds
        // Adding custom subview on top of our view
        addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": containerView!]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": containerView!]))
    }
}

extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
