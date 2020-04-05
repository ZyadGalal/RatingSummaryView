//
//  ViewController.swift
//  RatingSummaryReview
//
//  Created by macOS on 11/13/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ratingView: RatingSummaryView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        ratingView.calculateStarsValues(totalRating: 5, fiveStars: 5, fourStars: 0, threeStars: 0, twoStars: 0, oneStar: 0)


    }

}

