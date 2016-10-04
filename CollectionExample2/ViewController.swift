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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell1.myLabel.text = items[(indexPath as NSIndexPath).item]
        cell1.backgroundColor = UIColor.darkGray // make cell more visible in our example project
        cell1.layer.borderColor = UIColor.black.cgColor
        cell1.layer.borderWidth = 1
        cell1.layer.cornerRadius = 8
        
        return cell1
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell1 = collectionView.cellForItem(at: indexPath)
        cell1?.backgroundColor = UIColor.white
    }
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell1 = collectionView.cellForItem(at: indexPath)
        cell1?.backgroundColor = UIColor.darkGray
    }
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\((indexPath as NSIndexPath).item)!")
        let myInt = (indexPath as NSIndexPath).item
        print(" that means = \(items[myInt])!")
        let myEmo = items[myInt]
        speakThisPhrase(myEmo)
        
    }
}



// from:
// Pass a String, This Function Speaks it.
func speakThisPhrase(_ passedString: String){
    

    
    mySpeechSynth.stopSpeaking(at: AVSpeechBoundary.immediate)
    let myUtterance = AVSpeechUtterance(string: passedString)
    myUtterance.rate = 0.35
    myUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
    mySpeechSynth.speak(myUtterance)
    
    
}

