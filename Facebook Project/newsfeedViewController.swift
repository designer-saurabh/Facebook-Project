//
//  newsfeedViewController.swift
//  Facebook Project
//
//  Created by Saurabh Srivastava on 9/5/14.
//  Copyright (c) 2014 Saurabh Srivastava. All rights reserved.
//

import UIKit

class newsfeedViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
 scrollview.contentSize = CGSize(width: 320, height: 1100 )
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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