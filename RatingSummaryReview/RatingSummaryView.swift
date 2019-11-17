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
    
    
    func setValueForStars(totalRating : Float , countOfFiveStars:Float , countOfFourStars:Float , countOfThreeStars:Float, countOfTwoStars:Float, countOfOneStars:Float){
        if totalRating == (countOfFiveStars+countOfFourStars+countOfThreeStars+countOfTwoStars+countOfOneStars){
            let totalRating = totalRating
            let stars5 = Float(countOfFiveStars / totalRating)
            let stars4 = Float(countOfFourStars / totalRating)
            let stars3 = Float(countOfThreeStars / totalRating)
            let stars2 = Float(countOfTwoStars / totalRating)
            let stars1 = Float(countOfOneStars / totalRating)
            let average = Float(((countOfFiveStars * 5.0)+(countOfFourStars * 4.0)+(countOfThreeStars * 3.0)+(countOfTwoStars * 2.0)+(countOfOneStars * 1.0))/totalRating)
            
            setValuesForProgressBars(fiveStars: stars5, fourStars: stars4, threeStars: stars3, twoStars: stars2, oneStars: stars1)
            
            self.totalRatingLabel.text = "\(totalRating) Ratings"
            let doubleStr = String(format: "%.1f", average)
            self.currentAverageLabel.text = "\(doubleStr)"
        }
        else{
            fatalError("total rating must be equal to count of all stars")
        }
    }
    func setValuesForProgressBars(fiveStars : Float ,fourStars : Float ,threeStars : Float ,twoStars : Float ,oneStars : Float ){
        UIView.animate(withDuration: 1) {
            self.fiveRatingProgressView.setProgress(fiveStars, animated: true)
            self.fourRatingProgressView.setProgress(fourStars, animated: true)
            self.threeRatingProgressView.setProgress(threeStars, animated: true)
            self.twoRatingProgressView.setProgress(twoStars, animated: true)
            self.oneRatingProgressView.setProgress(oneStars, animated: true)
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
