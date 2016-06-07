//
//  BagContentsCollection.swift
//  DiceBag
//
//  Created by Jorge Catalan on 5/24/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import Foundation
import UIKit

class BagContentsCollectionViewController: UICollectionViewController {
    //Mark properties


    var diceBag = [[Die]]()
    var d4Array = [Die]()
    var d6Array = [Die]()
    var d10Array = [Die]()
    var d20Array = [Die]()
    let numberOfD4 = 5
    let numberOfD6 = 6
    let numberOfD10 = 3
    let numberOfD20 = 5
    
    override func viewDidLoad() {
        
        self.title = "Dice"
        
//diceBag goes here
        var index = 0
        while index < numberOfD4 {
            d4Array.append(Die(type: DieType.D4))
            index += 1
        }
        
        index = 0
        while index < numberOfD6 {
            d6Array.append(Die(type: DieType.D6))
            index += 1
        }
        
        index = 0
        while index < numberOfD10 {
            d10Array.append(Die(type: DieType.D10))
            index += 1
        }
        
        index = 0
        while index < numberOfD20 {
            d20Array.append(Die(type: DieType.D20))
            index += 1
        }
        
        diceBag = [d4Array, d6Array, d10Array, d20Array]
        
    }

    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return diceBag.count
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diceBag[section].count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("dieCell", forIndexPath: indexPath)
        
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        
        let die = diceBag[indexPath.section][indexPath.row]
        let label = UILabel(frame: cell.bounds)
        label.textAlignment = .Center
        label.textColor = UIColor .whiteColor()
        label.text = String(die.rollIt())
        cell.contentView.addSubview(label)
        cell.bounds.size.width = 45
        cell.bounds.size.height = 45
        cell.layer.cornerRadius = 10.0
        cell.layer.backgroundColor = die.color.CGColor
        
        
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
 
        return cell
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if(event.subtype == UIEventSubtype.MotionShake) {
            let alert = UIAlertController(title: "Shaken",
                                          message: "Not Stirred",
                                          preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK",
                style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            collectionView!.reloadData()
        }
    }
    

    

}