//
//  ViewController.swift
//  CollectionExample2
//
//  Created by Yoda Dev on 5/4/16.
//  Copyright © 2016 Yury G. All rights reserved.
//

import UIKit
import AVFoundation


//  ViewController Class-Wide Variables
let mySpeechSynth = AVSpeechSynthesizer()


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell1 = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell1.myLabel.text = items[indexPath.item]
        cell1.backgroundColor = UIColor.darkGrayColor() // make cell more visible in our example project
        cell1.layer.borderColor = UIColor.blackColor().CGColor
        cell1.layer.borderWidth = 1
        cell1.layer.cornerRadius = 8
        
        return cell1
    }
    
    // change background color when user touches cell
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell1 = collectionView.cellForItemAtIndexPath(indexPath)
        cell1?.backgroundColor = UIColor.whiteColor()
    }
    
    // change background color back when user releases touch
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell1 = collectionView.cellForItemAtIndexPath(indexPath)
        cell1?.backgroundColor = UIColor.darkGrayColor()
    }
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        let myInt = indexPath.item
        print(" that means = \(items[myInt])!")
        let myEmo = items[myInt]
        speakThisPhrase(myEmo)
        
    }
}



// from:
// Pass a String, This Function Speaks it.
func speakThisPhrase(passedString: String){
    
    let myUtterance = AVSpeechUtterance(string: passedString)
    myUtterance.rate = 0.35
    myUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
    mySpeechSynth.speakUtterance(myUtterance)
    
    
}

