//
//  RatingSummaryView.swift
//  RatingSummaryReview
//
//  Created by ZyadGalal on 11/14/19.
//  Copyright © 2019 ZyadGalal. All rights reserved.
//

import UIKit

@IBDesignable
 class RatingSummaryView: UIView {
    //IBOutlet Collection
    @IBOutlet var starsImageView: [UIImageView]!

    //IBOutlet
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
    //MARK :- Public Inspectable
    @IBInspectable public var animationTime : CGFloat = 1.0
    @IBInspectable public var isProgressStyleGradient : Bool = false {
        didSet{
            progressStyle = isProgressStyleGradient == false ? .Solid : .Gradient
            setProgressTintColor()
        }
    }
    @IBInspectable public var progressTint : UIColor = UIColor.darkGray {
        didSet{
            setProgressTintColor()

        }
    }
    @IBInspectable public var startProgressTint : UIColor = UIColor.darkGray {
        didSet{
            
            setProgressTintColor()
        }
    }
    @IBInspectable public var endProgressTint : UIColor = UIColor.darkGray {
        didSet{
            setProgressTintColor()
        }
    }
    @IBInspectable public var starsImage : UIImage?{
        didSet{
            for image in starsImageView {
                image.image = starsImage
            }
        }
    }
    
    var progressStyle : ProgressBarColorStyle = .Solid
    
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
    
    
    func calculateStarsValues(totalRating : Int , fiveStars:Float , fourStars:Float , threeStars:Float, twoStars:Float, oneStar:Float){
        if Float(totalRating) == (fiveStars + fourStars + threeStars + twoStars + oneStar){
            let totalRating = totalRating
            //calculate average for every progress view
            let fiveStarsAverage = fiveStars / Float(totalRating)
            let fourStarsAverage = fourStars / Float(totalRating)
            let threeStarsAverage = threeStars / Float(totalRating)
            let twoStarsAverage = twoStars / Float(totalRating)
            let oneStarAverage = oneStar / Float(totalRating)
            let average = ((fiveStars * 5.0) + (fourStars * 4.0) + (threeStars * 3.0) + (twoStars * 2.0) + (oneStar * 1.0)) / Float(totalRating)
            
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
        UIView.animate(withDuration: TimeInterval(animationTime)) {
            self.fiveRatingProgressView.setProgress(fiveStarsProgress, animated: true)
            self.fourRatingProgressView.setProgress(fourStarsProgress, animated: true)
            self.threeRatingProgressView.setProgress(threeStarsProgress, animated: true)
            self.twoRatingProgressView.setProgress(twoStarsProgress, animated: true)
            self.oneRatingProgressView.setProgress(oneStarsProgress, animated: true)
        }
        
    }
    private func setProgressTintColor(){
        if progressStyle == .Solid {
            fiveRatingProgressView.tintColor = progressTint
            fourRatingProgressView.tintColor = progressTint
            threeRatingProgressView.tintColor = progressTint
            twoRatingProgressView.tintColor = progressTint
            oneRatingProgressView.tintColor = progressTint
        }
        else if progressStyle == .Gradient {
            guard let gradientImage = UIImage.gradientImage(with: fiveRatingProgressView.frame, colors: [startProgressTint.cgColor , endProgressTint.cgColor], locations: nil) else{return}
            fiveRatingProgressView.progressImage = gradientImage
            fourRatingProgressView.progressImage = gradientImage
            threeRatingProgressView.progressImage = gradientImage
            twoRatingProgressView.progressImage = gradientImage
            oneRatingProgressView.progressImage = gradientImage

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
        
//        set constraints for containerView
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])

    }
}


