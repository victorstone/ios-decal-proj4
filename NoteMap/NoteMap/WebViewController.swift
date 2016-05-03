//
//  WebViewController.swift
//  NoteMap
//
//  Created by Victor Stone on 5/2/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation
import UIKit

class WebViewController : UIViewController {
    
    var webView : UIWebView!
    var pdfitem : pdfItem!
    var ytitem : youtubeItem!
    var url : NSURL!
    
    
    override func viewDidLoad() {
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        webView = UIWebView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        self.webView.scalesPageToFit = true;
        self.view.addSubview(webView)
        if pdfitem != nil {
            url = pdfitem.linkURL
        } else {
            url = ytitem.linkURL
        }
        let requestObj = NSURLRequest(URL: url)
        webView.loadRequest(requestObj)
        
        
        /*
        let url = NSURL (string: "youtube.com");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
        print(webView.loading)
        */
    }
}