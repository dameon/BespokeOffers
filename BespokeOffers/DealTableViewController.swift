//
//  DealTableViewController.swift
//  BespokeOffers
//
//  Created by Dameon Bryant on 6/21/15.
//  Copyright © 2015 Dameon Bryant. All rights reserved.
//

import UIKit

class DealTableViewController: UITableViewController{

    //MARK: Properties
    let bespokeURL = NSURL(string: "https://www.bespokeoffers.co.uk/mobile-api/v2/offers.json?page_size=10&page=1")
    var deals = [Deal]()
    var selectedDeal = Deal()
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bespoke"
        getDeals()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DealTableViewCell", forIndexPath: indexPath) as! DealTableViewCell
        
        let deal = deals[indexPath.row]
        cell.dealLabel?.text = deal.name
        
        //TODO write helper class to replace ugly way of displaying image via url
        let url = NSURL (string: deal.photoURL!)
        let imageData = NSData(contentsOfURL: url!)
        cell.dealImageView.image = UIImage(data: imageData!)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedDeal = deals[indexPath.row]
        performSegueWithIdentifier("detailsSegue", sender: self)
    }
    
    //MARK Deals Request
    func getDeals(){
        if let JSONData = NSData(contentsOfURL: bespokeURL!) {
            
            if let json = try! NSJSONSerialization.JSONObjectWithData(JSONData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                
                if let offersArray = json["offers"] as? [NSDictionary] {

                    for offer in offersArray {
                        
                        //print(offer)
                        let tempDeal = Deal()
                        tempDeal.name = (offer.objectForKey("title") as! String)
                        tempDeal.photos = (offer.objectForKey("images") as! NSMutableArray)
                        tempDeal.photoURL = tempDeal.photos?[0] as! String
                        tempDeal.dealDescription = (offer.objectForKey("description") as! String)
                        tempDeal.endDate = (offer.objectForKey("end_date") as! String)
                        tempDeal.priceDisplay = (offer.objectForKey("price_display") as! String)
                        deals.append(tempDeal)
                    }
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "detailsSegue"
        {
            if let dvc = segue.destinationViewController as? DetailViewController {
                dvc.dealSelected = selectedDeal
            }
        }
    }


}
