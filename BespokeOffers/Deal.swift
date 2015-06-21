//
//  Deal.swift
//  BespokeOffers
//
//  Created by Dameon Bryant on 6/21/15.
//  Copyright © 2015 Dameon Bryant. All rights reserved.
//

import UIKit

class Deal: NSObject {
    
    //MARK: Types
    
    struct PropertyKey {
        
        static let nameKey = "name"
        static let photoKey = "photo"
    }
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage
    
    init? (name: String, photo: UIImage?)
    {
        self.name = name
        self.photo = photo!
        
        super.init()
        
        if name.isEmpty {
            return nil
        }
    }

}
