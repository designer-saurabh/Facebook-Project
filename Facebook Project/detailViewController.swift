//
//  detailViewController.swift
//  Facebook Project
//
//  Created by Saurabh Srivastava on 9/5/14.
//  Copyright (c) 2014 Saurabh Srivastava. All rights reserved.
//

import UIKit

class detailViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var commentfield: UITextField!
    @IBOutlet weak var commentcontainer: UIView!
    @IBOutlet weak var commentbutton: UIButton!
    @IBOutlet weak var likebutton: UIButton!
    
    //@IBOutlet weak var imageView: UIImageView!
   
       @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //scrollview.contentSize = CGSizeMake(320, imageView.image!.size.height)
        scrollview.contentInset.top = 0
        scrollview.contentInset.bottom = 0
        scrollview.scrollIndicatorInsets.top = 0
        scrollview.scrollIndicatorInsets.bottom = 0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
        scrollview.contentSize = CGSizeMake(320, 1000)
        
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.commentcontainer.frame.origin.y = self.view.frame.size.height - kbSize.height - self.commentcontainer.frame.size.height
            
            }, completion: nil)
        
        
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            self.commentcontainer.frame.origin.y = self.scrollview.frame.size.height + self.scrollview.frame.origin.y
            
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func onlikebutton(sender: AnyObject) {
        likebutton.selected = !likebutton.selected
    }
   
    @IBAction func backbutton(sender: AnyObject) {
        navigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func oncomment(sender: AnyObject) {
        commentfield.becomeFirstResponder()
    }
   
    @IBAction func onComment(sender: AnyObject) {
        commentfield.becomeFirstResponder()
    }
    
    @IBAction func ontap(sender: AnyObject) {
        view.endEditing(true)
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
