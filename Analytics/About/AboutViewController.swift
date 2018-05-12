//
//  AboutViewController.swift
//  Analytics
//
//  Created by BigData on 27/04/18.
//  Copyright © 2018 BigData. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController, WKNavigationDelegate, UIWebViewDelegate {

    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://analytics.admedika.co.id/peruri/DASHBOARD1-1.php")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        webView.isUserInteractionEnabled = true
        webView.frame.size.height = 1
        webView.frame.size = webView.sizeThatFits(CGSize.zero)
        webView.scrollView.isScrollEnabled=true;
        
//        let myWebView:UIWebView = UIWebView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height))
//        myWebView.delegate = self
//        self.view.addSubview(myWebView)
//        let request = URLRequest(url: URL(string: "https://analytics.admedika.co.id/peruri/DASHBOARD1-1.php")!)
//        myWebView.loadRequest(request)

//        self.navigationItem.setHidesBackButton(true, animated:true);
        
        // Do any additional setup after loading the view.
    }

//    override func viewDidAppear(_ animated: Bool) {
//        let url = URL(string: "https://analytics.admedika.co.id/peruri/DASHBOARD1-1.php")!
//        webView.load(URLRequest(url: url))
//        webView.allowsBackForwardNavigationGestures = true
//        webView.isUserInteractionEnabled = true
//        webView.frame.size.height = 1
//        webView.frame.size = webView.sizeThatFits(CGSize.zero)
//        webView.scrollView.isScrollEnabled=true;
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
