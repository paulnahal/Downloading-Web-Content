//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Parampaul Nahal on 6/28/15.
//  Copyright (c) 2015 Nahal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://stackoverflow.com") //URL
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in //defined task, used method and returns 3 variables in this chunk of code
            
            if error == nil {
                
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) //converts to useful format
                
                println(urlContent)
                
                dispatch_async(dispatch_get_main_queue()) {
                        self.webView.loadHTMLString(urlContent! as String, baseURL: nil) //use self to refer to something created outside of enclosure
                }// "Dont wait for me, ill let you know when Im done but keep going on"
                

                
            } //check if any error (ie, is internet not working)
            
        }
        
        task.resume() //runs the task above
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

