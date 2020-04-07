//
//  ViewController.swift
//  RatingSummaryReview
//
//  Created by ZyadGalal on 11/13/19.
//  Copyright © 2019 ZyadGalal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ratingView: RatingSummaryView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        ratingView.setupRatingView(animationTime: 15, isProgressStyleGradient: true, progressTint: nil, startProgressTint: UIColor.black, endProgressTint: UIColor.blue, starsImage: nil, barsSpacing: nil)
        ratingView.calculateStarsValues(totalRating: 5, fiveStars: 2, fourStars: 2, threeStars: 1, twoStars: 0, oneStar: 0)

    }

}

