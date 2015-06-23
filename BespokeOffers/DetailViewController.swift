//
//  DetailViewController.swift
//  BespokeOffers
//
//  Created by Dameon Bryant on 6/21/15.
//  Copyright © 2015 Dameon Bryant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var dealTitleLabel: UILabel!
    @IBOutlet weak var dealImageView: UIImageView!
  
    @IBOutlet weak var dealDescTextView: UITextView!
    @IBOutlet weak var dealPriceLabel: UILabel!
    @IBOutlet weak var dealLimit: UILabel!
    
    var dealSelected = Deal()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        getCurrentDeal()
    }
    
    func getCurrentDeal(){
        self.title = dealSelected.name
        let url = NSURL (string: dealSelected.photoURL!)
        let imageData = NSData(contentsOfURL: url!)
        dealImageView.image = UIImage(data: imageData!)
        
        dealDescTextView.text = dealSelected.dealDescription
        //dealPriceLabel.text = dealSelected.priceDisplay
    }

}

