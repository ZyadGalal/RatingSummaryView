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
        ratingView.calculateStarsValues(totalRating: 5, fiveStars: 2, fourStars: 2, threeStars: 0, twoStars: 0, oneStar: 1)

    }

}

