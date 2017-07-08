//
//  TutorialViewController.swift
//  SplitAndPopover
//
//  Created by xrickliao on 29/06/2017.
//  Copyright © 2017 xrickliao. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    @IBOutlet weak var webview : UIWebView!
    @IBOutlet weak var toolbar : UIToolbar!
    @IBOutlet weak var pubDateButtonItem : UIBarButtonItem!

    var tutorialURL : NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.isHidden = true
        toolbar.isHidden =  true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if tutorialURL != nil {
            let request : NSURLRequest = NSURLRequest(url: tutorialURL as URL)
            webview.loadRequest(request as URLRequest)
        }
        
        if webview.isHidden{
            webview.isHidden = false
            toolbar.isHidden = false
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /**
     We are going to work with this method at the last part of the tutorial, when we’ll deal with the popover controller.
     */
    @IBAction func showPublishDate(sender : Any)
    {
    
    }

}
