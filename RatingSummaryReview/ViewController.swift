//
//  ViewController.swift
//  RatingSummaryReview
//
//  Created by macOS on 11/13/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rating5ProgressView: UIProgressView!
    @IBOutlet weak var rating4ProgressView: UIProgressView!
    @IBOutlet weak var rating3ProgressView: UIProgressView!
    @IBOutlet weak var rating2ProgressView: UIProgressView!
    @IBOutlet weak var rating1ProgressView: UIProgressView!
    
    @IBOutlet weak var totalRatingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let totalRating = 30.0
        let Stars5 = 15.0
        let Stars4 = 10.0
        let Stars3 = 1.0
        let Stars2 = 1.0
        let Stars1 = 1.0
        
        
        rating5ProgressView.progress = Float(Stars5 / totalRating)
        rating4ProgressView.progress = Float(Stars4 / totalRating)
        rating3ProgressView.progress = Float(Stars3 / totalRating)
        rating2ProgressView.progress = Float(Stars2 / totalRating)
        rating1ProgressView.progress = Float(Stars1 / totalRating)
        totalRatingLabel.text = "\(totalRating) Ratings"
    }


    
    
}

