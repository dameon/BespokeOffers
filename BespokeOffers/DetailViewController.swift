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
    var pickedDeal = Deal()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        dealTitleLabel.text = pickedDeal.name
        //dealImageView.image = pickedDeal.photo[0] as! UIImage
        
    }


}

