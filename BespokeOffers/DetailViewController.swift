//
//  DetailViewController.swift
//  BespokeOffers
//
//  Created by Dameon Bryant on 6/21/15.
//  Copyright © 2015 Dameon Bryant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var dealTitleLabel: UILabel!
    @IBOutlet weak var dealImageView: UIImageView!
    @IBOutlet weak var dealDescTextView: UITextView!
    @IBOutlet weak var dealPriceLabel: UILabel!
    @IBOutlet weak var dealEndDate: UILabel!
    var dealSelected = Deal()

    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Offer Details"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        getCurrentDeal()
    }
    
    func getCurrentDeal(){
        //TODO write helper class to replace ugly way of displaying image via url
        let url = NSURL (string: dealSelected.photoURL!)
        let imageData = NSData(contentsOfURL: url!)
        dealImageView.image = UIImage(data: imageData!)
        dealEndDate.text = dealSelected.endDate
        dealDescTextView.text = dealSelected.dealDescription
        dealPriceLabel.text = dealSelected.priceDisplay
    }

}

