//
//  HamburgerViewController.swift
//  Youtube Lab
//
//  Created by Nathaniel Hajian on 2/24/16.
//  Copyright © 2016 Nathaniel Hajian. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var feedView: UIView!
    
    var menuVC: UIViewController!
    var feedVC: UIViewController!
    var initialXPosition: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        var storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        menuVC = storyboard.instantiateViewControllerWithIdentifier("menuViewController") as! MenuViewController
        feedVC = storyboard.instantiateViewControllerWithIdentifier("feedViewController") as! FeedViewController
        
        
        addChildViewController(menuVC)
        addChildViewController(feedVC)
        
        
        menuView.addSubview(menuVC.view)
        menuVC.didMoveToParentViewController(self)
        
        feedView.addSubview(feedVC.view)
        feedVC.didMoveToParentViewController(self)
        
        
        let menuGestureRecognizer = UIPanGestureRecognizer(target: self, action: "screenEdgeSwiped:")
        
       
        
        view.addGestureRecognizer(menuGestureRecognizer)
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    func screenEdgeSwiped(recognizer: UIPanGestureRecognizer){
    
        var location = recognizer.locationInView(view)
        var translation = recognizer.translationInView(view)
        var velocity = recognizer.velocityInView(view)
        

    
        if recognizer.state == UIGestureRecognizerState.Began{
        
       initialXPosition = feedView.frame.origin.x
            
        
        } else if recognizer.state == UIGestureRecognizerState.Changed{
        
            
//            print(translation.x)
            
//            print("original position: ", self.feedVC.view.frame.origin.x)
            
           
            
            if feedView.frame.origin.x >= 0 && feedView.frame.origin.x < 300 {
            
//             self.feedVC.view.frame.origin.x = translation.x
                feedView.frame.origin.x = translation.x + initialXPosition
                
            
            }
        
        
        }else if recognizer.state == UIGestureRecognizerState.Ended{
            
            if velocity.x > 0 {
                UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseOut, animations: {
                    print("hey")
                    print(self.feedView.frame.origin.x)
                    
                    self.feedView.frame.origin.x = 280
                }, completion: nil)
            
            }else {
            
                UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseOut, animations: {
                    print("hey2")
                    print(self.feedView.frame.origin.x)
                    
                    self.feedView.frame.origin.x = 0
                    }, completion: nil)
            
            
            }
        
            
            
            
            
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
