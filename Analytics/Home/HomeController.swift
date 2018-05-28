//
//  HomeController.swift
//  Analytics
//
//  Created by BigData on 4/20/18.
//  Copyright © 2018 BigData. All rights reserved.
//

import UIKit
import MMDrawerController
import WebKit

class HomeController: UIViewController, WKNavigationDelegate, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkLogin();
        
        
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(HomeController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "home_icon_left_menu"), style: .plain, target: self, action: #selector(actionMenu(sender:)))
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
//        let myWebView:UIWebView = UIWebView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height))
//        myWebView.delegate = self
//        self.view.addSubview(myWebView)
//        let request = URLRequest(url: URL(string: "https://analytics.admedika.co.id/peruri/DASHBOARD3-1.php")!)
//        myWebView.loadRequest(request)

        
//        webView.allowsBackForwardNavigationGestures = true
//        webView.isUserInteractionEnabled = true
//        webView.frame.size.height = 1.5
        webView.delegate = self;
//        webView.frame.size = webView.sizeThatFits(CGSize.zero)
//        webView.scrollView.isScrollEnabled=true
        navigationController?.hidesBarsOnSwipe = true
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        let url = URL(string: "https://analytics.admedika.co.id/peruri/DASHBOARD3-1.php")!
//        webView.load(URLRequest(url: url))
//        webView.allowsBackForwardNavigationGestures = true
//        webView.isUserInteractionEnabled = true
//        webView.frame.size.height = 1
//        webView.frame.size = webView.sizeThatFits(CGSize.zero)
//        webView.scrollView.isScrollEnabled=true;
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        let drawerController = self.parent?.parent as! MMDrawerController;
        drawerController.openDrawerGestureModeMask = .all
        drawerController.closeDrawerGestureModeMask = .all
        
        let name = UserDefaults.standard.string(forKey: "username");
        if (name == "devbigdata"){
            self.actionMenu("https://analytics.admedika.co.id/kfmobile/dashboard7_1.php")
        } else if (name == "vassequis"){
            self.actionMenu("https://analytics.admedika.co.id/vasmobile/dashboard1.php")
        }
        
//       self.navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let drawerController = self.parent?.parent as! MMDrawerController;
        drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureMode(rawValue: 0)
        drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureMode(rawValue: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Menu
    func actionMenu(_ urlString: String) {
        let url = URL(string: urlString)!
        webView.loadRequest(URLRequest(url: url))
    }
    
    
    //MARK: Method
    func checkLogin() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "loginStoryID")
        self.present(loginVC, animated: true, completion: nil);
        
        
//        self.performSegue(withIdentifier: "presentLogin", sender: nil)
    }
    
    //MARK: Action
    @objc func actionMenu(sender: UIBarButtonItem) {
        let drawerController = self.parent?.parent as! MMDrawerController;
        drawerController.toggle(.left, animated: true, completion: nil);
    }
    
    
    //MARK: UIWebViewDelegate
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("hide loading");
//        webView.reload()
        webView.scalesPageToFit = true
    }
}

