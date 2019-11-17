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
        ratingView.setValueForStars(totalRating: 5, countOfFiveStars: 2, countOfFourStars: 2, countOfThreeStars: 0, countOfTwoStars: 0, countOfOneStars: 1)

    }

}

